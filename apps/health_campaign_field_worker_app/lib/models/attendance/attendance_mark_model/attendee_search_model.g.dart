// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendee_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceSearchIndividualModelImpl
    _$$AttendanceSearchIndividualModelImplFromJson(Map<String, dynamic> json) =>
        _$AttendanceSearchIndividualModelImpl(
          attendeeIndividuals: (json['attendance'] as List<dynamic>?)
              ?.map((e) =>
                  AttendeeIndividualModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$AttendanceSearchIndividualModelImplToJson(
        _$AttendanceSearchIndividualModelImpl instance) =>
    <String, dynamic>{
      'attendance': instance.attendeeIndividuals,
    };

_$AttendeeIndividualModelImpl _$$AttendeeIndividualModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendeeIndividualModelImpl(
      id: json['id'] as String?,
      registerId: json['registerId'] as String?,
      individualId: json['individualId'] as String?,
      tenantId: json['tenantId'] as String?,
      time: json['time'] as int? ?? 0,
      type: json['type'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$AttendeeIndividualModelImplToJson(
        _$AttendeeIndividualModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'registerId': instance.registerId,
      'individualId': instance.individualId,
      'tenantId': instance.tenantId,
      'time': instance.time,
      'type': instance.type,
      'status': instance.status,
    };
