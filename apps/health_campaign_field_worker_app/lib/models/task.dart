// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass(ignoreNull: true)
class TaskSearchModel extends EntitySearchModel {
  final String? id;
  final String? tenantId;
  final String? projectId;
  final String? projectBeneficiaryId;
  final String? createdBy;
  final String? status;
  final String? clientReferenceId;
  final DateTime? plannedStartDateTime;
  final DateTime? plannedEndDateTime;
  final DateTime? actualStartDateTime;
  final DateTime? actualEndDateTime;
  
  TaskSearchModel({
    this.id,
    this.tenantId,
    this.projectId,
    this.projectBeneficiaryId,
    this.createdBy,
    this.status,
    this.clientReferenceId,
    int? plannedStartDate,
    int? plannedEndDate,
    int? actualStartDate,
    int? actualEndDate,
    super.boundaryCode,
  }): plannedStartDateTime = plannedStartDate == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(plannedStartDate),
  plannedEndDateTime = plannedEndDate == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(plannedEndDate),
  actualStartDateTime = actualStartDate == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(actualStartDate),
  actualEndDateTime = actualEndDate == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(actualEndDate),
   super();

  int? get plannedStartDate => plannedStartDateTime?.millisecondsSinceEpoch;
  

  int? get plannedEndDate => plannedEndDateTime?.millisecondsSinceEpoch;
  

  int? get actualStartDate => actualStartDateTime?.millisecondsSinceEpoch;
  

  int? get actualEndDate => actualEndDateTime?.millisecondsSinceEpoch;
  
}

@MappableClass(ignoreNull: true)
class TaskModel extends EntityModel implements TaskSearchModel {
  
  @override
  final String? id;
  
  @override
  final String? tenantId;
  
  @override
  final String? projectId;
  
  @override
  final String? projectBeneficiaryId;
  
  @override
  final String? createdBy;
  final int? rowVersion;
  
  @override
  final String? status;
  
  @override
  final String clientReferenceId;
  final List<TaskResourceModel>? resources;
  final AddressModel? address;
  
  @override
  final DateTime? plannedStartDateTime;
  
  @override
  final DateTime? plannedEndDateTime;
  
  @override
  final DateTime? actualStartDateTime;
  
  @override
  final DateTime? actualEndDateTime;
  final DateTime? createdDateTime;
  

  TaskModel({
    this.id,
    this.tenantId,
    this.projectId,
    this.projectBeneficiaryId,
    this.createdBy,
    this.rowVersion,
    this.status,
    required this.clientReferenceId,
    this.resources,
    this.address,
    int? plannedStartDate,
    int? plannedEndDate,
    int? actualStartDate,
    int? actualEndDate,
    int? createdDate,
    super.auditDetails,
  }): plannedStartDateTime = plannedStartDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(plannedStartDate),
      plannedEndDateTime = plannedEndDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(plannedEndDate),
      actualStartDateTime = actualStartDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(actualStartDate),
      actualEndDateTime = actualEndDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(actualEndDate),
      createdDateTime = createdDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(createdDate),
       super();

  @override
  int?  get plannedStartDate => plannedStartDateTime?.millisecondsSinceEpoch;
  

  @override
  int?  get plannedEndDate => plannedEndDateTime?.millisecondsSinceEpoch;
  

  @override
  int?  get actualStartDate => actualStartDateTime?.millisecondsSinceEpoch;
  

  @override
  int?  get actualEndDate => actualEndDateTime?.millisecondsSinceEpoch;
  

  @override
  int?  get createdDate => createdDateTime?.millisecondsSinceEpoch;
  

  TaskCompanion get companion {
    return TaskCompanion(
      id: Value(id),
      tenantId: Value(tenantId),
      projectId: Value(projectId),
      projectBeneficiaryId: Value(projectBeneficiaryId),
      createdBy: Value(createdBy),
      rowVersion: Value(rowVersion),
      status: Value(status),
      clientReferenceId: Value(clientReferenceId),
      );
  }
}
