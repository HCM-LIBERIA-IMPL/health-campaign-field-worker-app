import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/beneficiary/distribution_center_card.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../blocs/scanner/scanner.dart';
import '../../blocs/search_households/search_households.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/environment_config.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../../utils/validations.dart' as validation;

class IndividualDetailsPage extends LocalizedStatefulWidget {
  final bool isHeadOfHousehold;

  const IndividualDetailsPage({
    super.key,
    super.appLocalizations,
    this.isHeadOfHousehold = false,
  });

  @override
  State<IndividualDetailsPage> createState() => _IndividualDetailsPageState();
}

class _IndividualDetailsPageState
    extends LocalizedState<IndividualDetailsPage> {
  static const _individualNameKey = 'individualName';
  static const _individualLastNameKey = 'individualLastName';
  static const _dobKey = 'dob';
  static const _genderKey = 'gender';
  static const _mobileNumberKey = 'mobileNumber';
  bool isDuplicateTag = false;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;
    final theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () {
        context
            .read<ScannerBloc>()
            .add(const ScannerEvent.handleScanner([], []));

        return Future.value(true);
      },
      child: Scaffold(
        body: ReactiveFormBuilder(
          form: () => buildForm(bloc.state),
          builder: (context, form, child) => BlocConsumer<
              BeneficiaryRegistrationBloc, BeneficiaryRegistrationState>(
            listener: (context, state) {
              state.mapOrNull(
                persisted: (value) {
                  if (value.navigateToRoot) {
                    (router.parent() as StackRouter).pop();
                  } else {
                    (router.parent() as StackRouter).pop();
                    router.push(AcknowledgementRoute());
                  }
                },
              );
            },
            builder: (context, state) {
              return ScrollableContent(
                header: const Column(children: [
                  BackNavigationHelpHeaderWidget(),
                ]),
                footer: SizedBox(
                  height: 85,
                  child: DigitCard(
                    margin: const EdgeInsets.only(left: 0, right: 0, top: 10),
                    child: DigitElevatedButton(
                      onPressed: () async {
                        final userId = context.loggedInUserUuid;
                        final projectId = context.projectId;
                        form.markAllAsTouched();
                        if (!form.valid) return;
                        FocusManager.instance.primaryFocus?.unfocus();

                        state.maybeWhen(
                          orElse: () {
                            return;
                          },
                          create: (
                            addressModel,
                            householdModel,
                            individualModel,
                            registrationDate,
                            searchQuery,
                            loading,
                            isHeadOfHousehold,
                            startTime,
                          ) async {
                            final individual = _getIndividualModel(
                              context,
                              form: form,
                              oldIndividual: null,
                            );

                            final locationBloc = context.read<LocationBloc>();
                            final locationInitialState = locationBloc.state;
                            final initialLat = locationInitialState.latitude;
                            final initialLng = locationInitialState.longitude;
                            final initialAccuracy =
                                locationInitialState.accuracy;
                            if (addressModel != null &&
                                (addressModel.latitude == null ||
                                    addressModel.longitude == null ||
                                    addressModel.locationAccuracy == null)) {
                              bloc.add(
                                BeneficiaryRegistrationSaveAddressEvent(
                                  addressModel.copyWith(
                                    latitude: initialLat ??
                                        addressModel.locationAccuracy,
                                    longitude: initialLng ??
                                        addressModel.locationAccuracy,
                                    locationAccuracy: initialAccuracy ??
                                        addressModel.locationAccuracy,
                                  ),
                                ),
                              );
                            }

                            final boundary = context.boundary;

                            bloc.add(
                              BeneficiaryRegistrationSaveIndividualDetailsEvent(
                                model: individual,
                                isHeadOfHousehold: widget.isHeadOfHousehold,
                              ),
                            );
                            final scannerBloc = context.read<ScannerBloc>();

                            if (scannerBloc.state.duplicate ||
                                scannerBloc.state.qrcodes.isEmpty) {
                              DigitToast.show(
                                context,
                                options: DigitToastOptions(
                                  scannerBloc.state.duplicate
                                      ? localizations.translate(
                                          i18.deliverIntervention
                                              .resourceAlreadyScanned,
                                        )
                                      : localizations.translate(
                                          i18.deliverIntervention
                                              .resourceScanningMandatory,
                                        ),
                                  true,
                                  theme,
                                ),
                              );
                            } else {
                              final submit = await DigitDialog.show<bool>(
                                context,
                                options: DigitDialogOptions(
                                  titleText: localizations.translate(
                                    i18.deliverIntervention.dialogTitle,
                                  ),
                                  contentText: localizations.translate(
                                    i18.deliverIntervention.dialogContent,
                                  ),
                                  primaryAction: DigitDialogActions(
                                    label: localizations.translate(
                                      i18.common.coreCommonSubmit,
                                    ),
                                    action: (context) {
                                      Navigator.of(
                                        context,
                                        rootNavigator: true,
                                      ).pop(true);
                                    },
                                  ),
                                  secondaryAction: DigitDialogActions(
                                    label: localizations.translate(
                                      i18.common.coreCommonCancel,
                                    ),
                                    action: (context) => Navigator.of(
                                      context,
                                      rootNavigator: true,
                                    ).pop(false),
                                  ),
                                ),
                              );

                              if (submit ?? false) {
                                if (context.mounted) {
                                  final scannerBloc =
                                      context.read<ScannerBloc>();

                                  bloc.add(
                                    BeneficiaryRegistrationCreateEvent(
                                      projectId: projectId,
                                      userUuid: userId,
                                      boundary: boundary,
                                      tag: scannerBloc.state.qrcodes.isNotEmpty
                                          ? scannerBloc.state.qrcodes.first
                                          : null,
                                    ),
                                  );
                                }
                              }
                            }
                          },
                          editIndividual: (
                            householdModel,
                            individualModel,
                            addressModel,
                            projectBeneficiaryModel,
                            loading,
                          ) {
                            final scannerBloc = context.read<ScannerBloc>();
                            final individual = _getIndividualModel(
                              context,
                              form: form,
                              oldIndividual: individualModel,
                            );
                            final tag = scannerBloc.state.qrcodes.isNotEmpty
                                ? scannerBloc.state.qrcodes.first
                                : null;

                            if (tag != null &&
                                    tag != projectBeneficiaryModel?.tag &&
                                    scannerBloc.state.duplicate ||
                                scannerBloc.state.qrcodes.isEmpty) {
                              DigitToast.show(
                                context,
                                options: DigitToastOptions(
                                  scannerBloc.state.duplicate
                                      ? localizations.translate(
                                          i18.deliverIntervention
                                              .resourceAlreadyScanned,
                                        )
                                      : localizations.translate(
                                          i18.deliverIntervention
                                              .resourceScanningMandatory,
                                        ),
                                  true,
                                  theme,
                                ),
                              );
                            } else {
                              bloc.add(
                                BeneficiaryRegistrationUpdateIndividualDetailsEvent(
                                  addressModel: addressModel,
                                  model: individual.copyWith(
                                    clientAuditDetails: (individual
                                                    .clientAuditDetails
                                                    ?.createdBy !=
                                                null &&
                                            individual.clientAuditDetails
                                                    ?.createdTime !=
                                                null)
                                        ? ClientAuditDetails(
                                            createdBy: individual
                                                .clientAuditDetails!.createdBy,
                                            createdTime: individual
                                                .clientAuditDetails!
                                                .createdTime,
                                            lastModifiedBy:
                                                context.loggedInUserUuid,
                                            lastModifiedTime: context
                                                .millisecondsSinceEpoch(),
                                          )
                                        : null,
                                  ),
                                  tag: scannerBloc.state.qrcodes.isNotEmpty
                                      ? scannerBloc.state.qrcodes.first
                                      : null,
                                ),
                              );
                            }
                          },
                          addMember: (
                            addressModel,
                            householdModel,
                            loading,
                          ) {
                            final individual = _getIndividualModel(
                              context,
                              form: form,
                            );

                            if (context.mounted) {
                              final scannerBloc = context.read<ScannerBloc>();

                              if (scannerBloc.state.duplicate ||
                                  scannerBloc.state.qrcodes.isEmpty) {
                                DigitToast.show(
                                  context,
                                  options: DigitToastOptions(
                                    scannerBloc.state.duplicate
                                        ? localizations.translate(
                                            i18.deliverIntervention
                                                .resourceAlreadyScanned,
                                          )
                                        : localizations.translate(
                                            i18.deliverIntervention
                                                .resourceScanningMandatory,
                                          ),
                                    true,
                                    theme,
                                  ),
                                );
                              } else {
                                bloc.add(
                                  BeneficiaryRegistrationAddMemberEvent(
                                    beneficiaryType: context.beneficiaryType,
                                    householdModel: householdModel,
                                    individualModel: individual,
                                    addressModel: addressModel,
                                    userUuid: userId,
                                    projectId: context.projectId,
                                    tag: scannerBloc.state.qrcodes.isNotEmpty
                                        ? scannerBloc.state.qrcodes.first
                                        : null,
                                  ),
                                );
                              }
                            }
                          },
                        );
                      },
                      child: Center(
                        child: Text(
                          state.mapOrNull(
                                editIndividual: (value) => localizations
                                    .translate(i18.common.coreCommonSave),
                              ) ??
                              localizations
                                  .translate(i18.common.coreCommonSubmit),
                        ),
                      ),
                    ),
                  ),
                ),
                children: [
                  DigitCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const DistributionCenterCard(
                          leftPadding: false,
                        ),
                        Text(
                          localizations.translate(
                            i18.individualDetails.individualsDetailsLabelText,
                          ),
                          style: theme.textTheme.displayMedium,
                        ),
                        Column(
                          children: [
                            DigitTextFormField(
                              formControlName: _individualNameKey,
                              label: localizations.translate(
                                i18.individualDetails.firstNameLabelText,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(
                                  "[a-zA-Z ]",
                                )),
                              ],
                              maxLength: 200,
                              isRequired: true,
                              validationMessages: {
                                'required': (object) => localizations.translate(
                                      i18.individualDetails
                                          .firstNameIsRequiredError,
                                    ),
                                'minLength': (object) =>
                                    localizations.translate(
                                      i18.individualDetails
                                          .firstNameLengthError,
                                    ),
                                'maxLength': (object) =>
                                    localizations.translate(
                                      i18.individualDetails
                                          .firstNameLengthError,
                                    ),
                              },
                            ),
                            DigitTextFormField(
                              formControlName: _individualLastNameKey,
                              label: localizations.translate(
                                i18.individualDetails.lastNameLabelText,
                              ),
                              maxLength: 200,
                              isRequired: true,
                              validationMessages: {
                                'required': (object) => localizations.translate(
                                      i18.individualDetails
                                          .lastNameIsRequiredError,
                                    ),
                                'minLength': (object) =>
                                    localizations.translate(
                                      i18.individualDetails.lastNameLengthError,
                                    ),
                                'maxLength': (object) =>
                                    localizations.translate(
                                      i18.individualDetails.lastNameLengthError,
                                    ),
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(
                                  "[a-zA-Z ]",
                                )),
                              ],
                            ),
                            Offstage(
                              offstage: !widget.isHeadOfHousehold,
                              child: DigitCheckbox(
                                label: localizations.translate(
                                  i18.individualDetails.checkboxLabelText,
                                ),
                                value: widget.isHeadOfHousehold,
                              ),
                            ),
                            BlocBuilder<AppInitializationBloc,
                                AppInitializationState>(
                              builder: (context, state) => state.maybeWhen(
                                orElse: () => const Offstage(),
                                initialized: (appConfiguration, _) {
                                  final genderOptions =
                                      appConfiguration.genderOptions ??
                                          <GenderOptions>[];

                                  return DigitDropdown<String>(
                                    label: localizations.translate(
                                      i18.individualDetails.genderLabelText,
                                    ),
                                    valueMapper: (value) =>
                                        localizations.translate(value),
                                    initialValue:
                                        genderOptions.firstOrNull?.name,
                                    menuItems: genderOptions
                                        .map(
                                          (e) => e.name,
                                        )
                                        .toList(),
                                    formControlName: _genderKey,
                                    isRequired: true,
                                    validationMessages: {
                                      'required': (object) =>
                                          localizations.translate(
                                            i18.common.corecommonRequired,
                                          ),
                                    },
                                  );
                                },
                              ),
                            ),
                            DigitTextFormField(
                              keyboardType: TextInputType.number,
                              formControlName: _mobileNumberKey,
                              label: localizations.translate(
                                i18.individualDetails.mobileNumberLabelText,
                              ),
                              maxLength: 10,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]"),
                                ),
                              ],
                              validationMessages: {
                                'mobileNumber': (object) =>
                                    localizations.translate(i18
                                        .individualDetails
                                        .mobileNumberInvalidFormatValidationMessage),
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        BlocBuilder<ScannerBloc, ScannerState>(
                          builder: (context, state) => state.qrcodes.isNotEmpty
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Text(
                                        localizations.translate(
                                          i18.deliverIntervention.voucherCode,
                                        ),
                                        style: theme.textTheme.headlineSmall,
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        localizations
                                            .translate(state.qrcodes.last),
                                      ),
                                    ),
                                    IconButton(
                                      color: theme.colorScheme.secondary,
                                      icon: const Icon(Icons.qr_code),
                                      onPressed: () {
                                        context.read<ScannerBloc>().add(
                                              const ScannerEvent.handleScanner(
                                                [],
                                                [],
                                              ),
                                            );
                                        // TODO : [Need to handle the Scanner event];
                                        // context.read<ScannerBloc>().add(ScannerScanEvent())
                                        context.router.push(QRScannerRoute(
                                          quantity: 1,
                                          isGS1code: true,
                                          sinlgleValue: true,
                                          isEditEnabled: true,
                                        ));
                                      },
                                    ),
                                  ],

                                  // ignore: no-empty-block
                                )
                              : DigitOutlineIconButton(
                                  onPressed: () {
                                    context.read<ScannerBloc>().add(
                                          const ScannerEvent.handleScanner(
                                            [],
                                            [],
                                          ),
                                        );
                                    context.router.push(QRScannerRoute(
                                      quantity: 1,
                                      isGS1code: true,
                                      sinlgleValue: true,
                                    ));
                                  },
                                  icon: Icons.qr_code,
                                  label: localizations.translate(
                                    i18.individualDetails
                                        .linkVoucherToIndividual,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  IndividualModel _getIndividualModel(
    BuildContext context, {
    required FormGroup form,
    IndividualModel? oldIndividual,
  }) {
    var individual = oldIndividual;
    individual ??= IndividualModel(
      clientReferenceId: IdGen.i.identifier,
      tenantId: envConfig.variables.tenantId,
      rowVersion: 1,
      auditDetails: AuditDetails(
        createdBy: context.loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: context.loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: context.loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: context.loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
    );

    var name = individual.name;
    name ??= NameModel(
      individualClientReferenceId: individual.clientReferenceId,
      tenantId: envConfig.variables.tenantId,
      rowVersion: 1,
      auditDetails: AuditDetails(
        createdBy: context.loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: context.loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: context.loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: context.loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
    );

    var identifier = (individual.identifiers?.isNotEmpty ?? false)
        ? individual.identifiers!.first
        : null;

    identifier ??= IdentifierModel(
      clientReferenceId: individual.clientReferenceId,
      tenantId: envConfig.variables.tenantId,
      rowVersion: 1,
      auditDetails: AuditDetails(
        createdBy: context.loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: context.loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: context.loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: context.loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
    );

    individual = individual.copyWith(
      name: name.copyWith(
        givenName: form.control(_individualNameKey).value,
        familyName:
            (form.control(_individualLastNameKey).value as String).trim(),
      ),
      gender: form.control(_genderKey).value == null
          ? null
          : Gender.values
              .byName(form.control(_genderKey).value.toString().toLowerCase()),
      mobileNumber: form.control(_mobileNumberKey).value,
      identifiers: [
        identifier.copyWith(
          identifierId: 'DEFAULT',
          identifierType: 'DEFAULT',
        ),
      ],
    );

    return individual;
  }

  FormGroup buildForm(BeneficiaryRegistrationState state) {
    final individual = state.mapOrNull<IndividualModel>(
      editIndividual: (value) {
        if (value.projectBeneficiaryModel?.tag != null) {
          context
              .read<ScannerBloc>()
              .add(ScannerScanEvent([], [value.projectBeneficiaryModel!.tag!]));
        }

        return value.individualModel;
      },
    );

    final searchQuery = state.mapOrNull<String>(
      create: (value) {
        return value.searchQuery;
      },
    );

    return fb.group(<String, Object>{
      _individualNameKey: FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(validation.individual.nameMinLength),
          Validators.maxLength(validation.individual.nameMaxLength),
        ],
        value: individual?.name?.givenName ?? searchQuery?.trim(),
      ),
      _individualLastNameKey: FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(validation.individual.nameMinLength),
          Validators.maxLength(validation.individual.nameMaxLength),
        ],
        value: individual?.name?.familyName ?? '',
      ),
      _genderKey: FormControl<String>(
        validators: [
          Validators.required,
        ],
        value: context.read<AppInitializationBloc>().state.maybeWhen(
              orElse: () => null,
              initialized: (appConfiguration, serviceRegistryList) {
                final options =
                    appConfiguration.genderOptions ?? <GenderOptions>[];

                return options.map((e) => e.code).firstWhereOrNull(
                      (element) =>
                          element.toLowerCase() == individual?.gender?.name,
                    );
              },
            ),
      ),
      _mobileNumberKey:
          FormControl<String>(value: individual?.mobileNumber, validators: [
        CustomValidator.validMobileNumber,
      ]),
    });
  }
}
