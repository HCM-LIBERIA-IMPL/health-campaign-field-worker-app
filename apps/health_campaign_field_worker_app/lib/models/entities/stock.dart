// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class StockSearchModel extends EntitySearchModel {
  final String? id;
  final String? tenantId;
  final String? facilityId;
  final String? productVariantId;
  final String? referenceId;
  final String? referenceIdType;
  final String? transactingPartyId;
  final String? transactingPartyType;
  final List<String>? clientReferenceId;
  final List<TransactionType>? transactionType;
  final List<TransactionReason>? transactionReason;
  
  StockSearchModel({
    this.id,
    this.tenantId,
    this.facilityId,
    this.productVariantId,
    this.referenceId,
    this.referenceIdType,
    this.transactingPartyId,
    this.transactingPartyType,
    this.clientReferenceId,
    this.transactionType,
    this.transactionReason,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  StockSearchModel.ignoreDeleted({
    this.id,
    this.tenantId,
    this.facilityId,
    this.productVariantId,
    this.referenceId,
    this.referenceIdType,
    this.transactingPartyId,
    this.transactingPartyType,
    this.clientReferenceId,
    this.transactionType,
    this.transactionReason,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class StockModel extends EntityModel {

  static const schemaName = 'Stock';

  final String? id;
  final String? tenantId;
  final String? facilityId;
  final String? productVariantId;
  final String? referenceId;
  final String? referenceIdType;
  final String? transactingPartyId;
  final String? transactingPartyType;
  final String? quantity;
  final String? waybillNumber;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final int? rowVersion;
  final TransactionType? transactionType;
  final TransactionReason? transactionReason;
  final StockAdditionalFields? additionalFields;

  StockModel({
    this.additionalFields,
    this.id,
    this.tenantId,
    this.facilityId,
    this.productVariantId,
    this.referenceId,
    this.referenceIdType,
    this.transactingPartyId,
    this.transactingPartyType,
    this.quantity,
    this.waybillNumber,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.rowVersion,
    this.transactionType,
    this.transactionReason,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  StockCompanion get companion {
    return StockCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      clientCreatedTime: Value(clientAuditDetails?.createdTime),
      clientModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
      clientCreatedBy: Value(clientAuditDetails?.createdBy),
      clientModifiedBy: Value(clientAuditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      id: Value(id),
      tenantId: Value(tenantId),
      facilityId: Value(facilityId),
      productVariantId: Value(productVariantId),
      referenceId: Value(referenceId),
      referenceIdType: Value(referenceIdType),
      transactingPartyId: Value(transactingPartyId),
      transactingPartyType: Value(transactingPartyType),
      quantity: Value(quantity),
      waybillNumber: Value(waybillNumber),
      nonRecoverableError: Value(nonRecoverableError),
      clientReferenceId: Value(clientReferenceId),
      rowVersion: Value(rowVersion),
      transactionType: Value(transactionType),
      transactionReason: Value(transactionReason),
      );
  }
}

@MappableClass(ignoreNull: true)
class StockAdditionalFields extends AdditionalFields {
  StockAdditionalFields({
    super.schema = 'Stock',
    required super.version,
    super.fields,
  });
}
