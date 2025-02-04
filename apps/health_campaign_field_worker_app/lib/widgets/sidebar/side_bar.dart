import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/localization/app_localization.dart';
import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/auth/auth.dart';
import '../../blocs/boundary/boundary.dart';
import '../../blocs/localization/localization.dart';
import '../../blocs/user/user.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/constants.dart';
import '../../utils/extensions/extensions.dart';
import '../../utils/i18_key_constants.dart' as i18;

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isDistributor = context.loggedInUserRoles
        .where(
          (role) => role.code == RolesType.distributor.toValue(),
        )
        .toList()
        .isNotEmpty;

    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return ScrollableContent(
        footer: SizedBox(
          height: 100,
          child: PoweredByDigit(
            version: Constants().version,
          ),
        ),
        children: [
          Container(
            color: theme.colorScheme.secondary.withOpacity(0.12),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: state.maybeMap(
                authenticated: (value) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value.userModel.name.toString(),
                      style: theme.textTheme.displayMedium,
                    ),

                    // const SizedBox(
                    //   height: 8,
                    // ),
                    Text(
                      value.userModel.mobileNumber.toString(),
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
                orElse: () => const Offstage(),
              ),
            ),
          ),
          DigitIconTile(
            title: AppLocalizations.of(context).translate(
              i18.common.coreCommonHome,
            ),
            icon: Icons.home,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              context.router.replace(HomeRoute());
            },
          ),
          BlocBuilder<AppInitializationBloc, AppInitializationState>(
            builder: (context, state) {
              if (state is! AppInitialized) return const Offstage();

              final appConfig = state.appConfiguration;
              final languages = state.appConfiguration.languages;
              final localizationModulesList =
                  state.appConfiguration.backendInterface;

              return DigitIconTile(
                title: AppLocalizations.of(context).translate(
                  i18.common.coreCommonlanguage,
                ),
                icon: Icons.language,
                onPressed: () {
                  // TODO: Complete implementation
                },
                content: Offstage(
                  offstage: languages == null,
                  child: BlocBuilder<LocalizationBloc, LocalizationState>(
                    builder: (context, localizationState) {
                      return localizationModulesList != null
                          ? Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: DigitRowCard(
                                onChanged: (value) {
                                  int index = languages.indexWhere(
                                    (ele) =>
                                        ele.value.toString() ==
                                        value.value.toString(),
                                  );
                                  context
                                      .read<LocalizationBloc>()
                                      .add(LocalizationEvent.onLoadLocalization(
                                        module: localizationModulesList
                                            .interfaces
                                            .where((element) =>
                                                element.type ==
                                                Modules.localizationModule)
                                            .map((e) => e.name.toString())
                                            .join(',')
                                            .toString(),
                                        tenantId:
                                            appConfig.tenantId ?? "default",
                                        locale: value.value.toString(),
                                        path: Constants.localizationApiPath,
                                      ));

                                  context.read<LocalizationBloc>().add(
                                        OnUpdateLocalizationIndexEvent(
                                          index: index,
                                          code: value.value.toString(),
                                        ),
                                      );
                                },
                                rowItems: languages!.map((e) {
                                  var index = languages.indexOf(e);

                                  return DigitRowCardModel(
                                    label: e.label,
                                    value: e.value,
                                    isSelected:
                                        index == localizationState.index,
                                  );
                                }).toList(),
                                width: (MediaQuery.of(context).size.width *
                                        0.65 /
                                        languages.length) -
                                    (14 * languages.length),
                              ),
                            )
                          : const Offstage();
                    },
                  ),
                ),
              );
            },
          ),
          BlocBuilder<UserBloc, UserState>(builder: (ctx, state) {
            return DigitIconTile(
              title: AppLocalizations.of(context).translate(
                i18.common.coreCommonProfile,
              ),
              icon: Icons.person,
              onPressed: () async {
                final connectivityResult =
                    await (Connectivity().checkConnectivity());
                final isOnline =
                    connectivityResult == ConnectivityResult.wifi ||
                        connectivityResult == ConnectivityResult.mobile;

                if (isOnline) {
                  if (context.mounted) {
                    Navigator.of(context, rootNavigator: true).pop();
                    context.router.push(ProfileRoute());
                  }
                } else {
                  if (context.mounted) {
                    DigitDialog.show(
                      context,
                      options: DigitDialogOptions(
                        titleText: AppLocalizations.of(context).translate(
                          i18.common.connectionLabel,
                        ),
                        contentText: AppLocalizations.of(context).translate(
                          i18.common.connectionContent,
                        ),
                        primaryAction: DigitDialogActions(
                          label: AppLocalizations.of(context).translate(
                            i18.common.coreCommonOk,
                          ),
                          action: (ctx) =>
                              Navigator.of(context, rootNavigator: true).pop(),
                        ),
                      ),
                    );
                  }
                }
              },
            );
          }),
          if (isDistributor)
            DigitIconTile(
              title: AppLocalizations.of(context).translate(
                i18.common.coreCommonViewDownloadedData,
              ),
              icon: Icons.download,
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                context.router.push(const BeneficiariesReportRoute());
              },
            ),
          DigitIconTile(
            title: AppLocalizations.of(context)
                .translate(i18.common.coreCommonLogout),
            icon: Icons.logout,
            onPressed: () {
              context.read<BoundaryBloc>().add(const BoundaryResetEvent());
              context.read<AuthBloc>().add(const AuthLogoutEvent());
            },
          ),
        ],
      );
    });
  }
}
