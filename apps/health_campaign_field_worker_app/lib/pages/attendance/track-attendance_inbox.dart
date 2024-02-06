import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../blocs/attendance/attendance_register.dart';
import '../../blocs/localization/app_localization.dart';
import '../../models/attendance/attendance_mark_model/register_model.dart';
import '../../router/app_router.dart';
import '../../utils/environment_config.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

class TrackAttendanceInboxPage extends LocalizedStatefulWidget {
  const TrackAttendanceInboxPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<TrackAttendanceInboxPage> createState() =>
      _TrackAttendanceInboxPageState();
}

class _TrackAttendanceInboxPageState extends State<TrackAttendanceInboxPage> {
  List<Map<dynamic, dynamic>> projectList = [];
  List<AttendanceMarkRegisterModel> attendanceRegisters = [];
  bool empty = false;

  @override
  void initState() {
    context.read<AttendanceProjectsSearchBloc>().add(
          SearchAttendanceProjectsEvent(
            projectid: context.projectId,
            tenantId: envConfig.variables.tenantId,
            // tenantId: 'lb',
          ),
        );
    super.initState();
  }

  @override
  void dispose() {
    projectList.clear();
    attendanceRegisters.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener<AttendanceProjectsSearchBloc,
            AttendanceProjectsSearchState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              loaded: (AttendanceMarkRegisterModelResponse?
                  attendanceRegistersModel) {
                attendanceRegisters = List<AttendanceMarkRegisterModel>.from(
                  attendanceRegistersModel!.attendanceRegister!,
                );
                if (attendanceRegisters.isEmpty) {
                  projectList = [];
                  empty = true;
                } else {
                  empty = false;
                  attendanceRegisters.sort(
                    (a, b) => DateTime.parse(DateFormat('yyyy-MM-dd').format(
                      DateTime.fromMillisecondsSinceEpoch(a.startDate!),
                    )).compareTo(
                      DateTime.parse(DateFormat('yyyy-MM-dd').format(
                        DateTime.fromMillisecondsSinceEpoch(b.startDate!),
                      )),
                    ),
                  );

                  projectList = attendanceRegisters
                      .map((e) => {
                            localizations.translate(i18.attendance.eventType):
                                e.serviceCode,
                            localizations
                                    .translate(i18.attendance.eventDescription):
                                (e.additionalDetails != null)
                                    ? e.additionalDetails!.description ?? ""
                                    : "",
                            localizations
                                    .translate(i18.attendance.eventBoundary):
                                (e.additionalDetails != null)
                                    ? e.additionalDetails!.boundary ??
                                        context.boundary.name
                                    : context.boundary.name,
                            localizations.translate(
                              i18.attendance.eventTotalAttendees,
                            ): e.attendanceAttendees != null
                                ? e.attendanceAttendees
                                    ?.where((att) =>
                                        att.denrollmentDate == null ||
                                        !(att.denrollmentDate! <=
                                            DateTime.now()
                                                .millisecondsSinceEpoch))
                                    .toList()
                                    .length
                                : 0,
                            localizations
                                    .translate(i18.attendance.eventStartDate):
                                DateFormat('dd/MM/yyyy').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                e.startDate!,
                              ),
                            ),
                            localizations
                                    .translate(i18.attendance.eventEndDate):
                                DateFormat('dd/MM/yyyy').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                e.endDate!,
                              ),
                            ),
                            localizations.translate(i18.attendance.eventStatus):
                                e.status,
                          })
                      .toList();
                }
              },
              error: (String? error) => Container(),
              orElse: () => Container(),
            );
          },
          child: BlocBuilder<AttendanceProjectsSearchBloc,
              AttendanceProjectsSearchState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => Container(),
                loading: () => Center(
                  child: Loaders.circularLoader(context),
                ),
                loaded: (AttendanceMarkRegisterModelResponse? attendanceModel) {
                  var list = <Widget>[];

                  if (projectList.isEmpty) {
                    list = [];
                    empty = true;
                  } else {
                    for (int i = 0; i < projectList.length; i++) {
                      list.add(RegistarCard(
                        data: projectList[i] as Map<String, dynamic>,
                        regisId: attendanceRegisters![i].id!,
                        tenatId: attendanceRegisters![i].tenantId!,
                        show: true,
                        attendee:
                            attendanceRegisters![i].attendanceAttendees ?? [],
                        startdate: DateTime.fromMillisecondsSinceEpoch(
                          attendanceRegisters[i].startDate!,
                        ),
                        endDate: DateTime.fromMillisecondsSinceEpoch(
                          attendanceRegisters[i].endDate!,
                        ),
                        localizations: localizations,
                      ));
                    }

                    empty = false;
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BackNavigationHelpHeaderWidget(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "${localizations.translate(i18.attendance.attendanceRegistarLabel)}(${projectList.length})",
                          style: DigitTheme
                              .instance.mobileTheme.textTheme.headlineLarge
                              ?.apply(color: const DigitColors().black),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      empty
                          ? const Center(
                              child: Card(
                                child: SizedBox(
                                  height: 60,
                                  width: 200,
                                  child: Center(child: Text("No Data Found")),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      ...list,
                      const SizedBox(
                        height: 16.0,
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class RegistarCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final String tenatId;
  final String regisId;
  final bool show;
  final DateTime startdate;
  final DateTime endDate;
  final List<AttendanceMarkIndividualModelAttendee> attendee;

  final AppLocalizations localizations;
  const RegistarCard({
    super.key,
    required this.data,
    required this.tenatId,
    required this.regisId,
    this.show = false,
    required this.attendee,
    required this.startdate,
    required this.endDate,
    required this.localizations,
  });

  @override
  Widget build(BuildContext context) {
    DateTime s = DateTime.now();

    return DigitCard(
      child: Column(
        children: [
          DigitTableCard(
            element: data,
          ),
          show
              ? DigitElevatedButton(
                  child: Text(
                    localizations.translate(
                      ((s.isAfter(startdate) ||
                                  s.isAtSameMomentAs(startdate)) &&
                              (s.isBefore(endDate) ||
                                  s.isAtSameMomentAs(endDate)))
                          ? i18.attendance.markAttendanceLabel
                          : i18.attendance.viewAttendanceButton,
                    ),
                  ),
                  onPressed: () {
                    context.router.push(AttendanceDateSessionSelectionRoute(
                      //id: registarId

                      id: regisId,
                      tenantId: tenatId,
                      attendanceMarkIndividualModelAttendee:
                          fetchAttendeeList(attendee),
                      eventEnd: endDate,
                      eventStart: startdate,
                    ));
                  },
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  List<String> fetchAttendeeList(
    List<AttendanceMarkIndividualModelAttendee> s,
  ) {
    final d = s
        .map(
          (e) => e.individualId!,
        )
        .toList();

    return d;
  }
}
