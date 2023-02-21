// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class TaskResourceSearchModel extends EntitySearchModel {
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  
  TaskResourceSearchModel({
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class TaskResourceModel extends EntityModel {
  final String? id;
  final String? productVariantId;
  final String? quantity;
  final bool? isDelivered;
  final String? deliveryComment;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  

  TaskResourceModel({
    this.id,
    this.productVariantId,
    this.quantity,
    this.isDelivered,
    this.deliveryComment,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    super.auditDetails,
    super.clientReferenceId,
  }):  super();

  TaskResourceCompanion get companion {
    return TaskResourceCompanion(
      id: Value(id),
      productVariantId: Value(productVariantId),
      quantity: Value(quantity),
      isDelivered: Value(isDelivered),
      deliveryComment: Value(deliveryComment),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      );
  }
}
