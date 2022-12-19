import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class TaskResourceRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? productVariantId;
  final String? quantity;
  final bool? isDelivered;
  final String? deliveryComment;
  
  
  
  TaskResourceRequestModel({
    this.id,
    this.tenantId,
    this.productVariantId,
    this.quantity,
    this.isDelivered,
    this.deliveryComment,
    super.auditDetails,
  }):  super();

  
}

@MappableClass()
class TaskResourceModel extends DataModel implements TaskResourceRequestModel {
  
  @override
  final String id;
  
  @override
  final String tenantId;
  
  @override
  final String productVariantId;
  
  @override
  final String quantity;
  
  @override
  final bool isDelivered;
  
  @override
  final String? deliveryComment;
  
  
  

  TaskResourceModel({
    required this.id,
    required this.tenantId,
    required this.productVariantId,
    required this.quantity,
    required this.isDelivered,
     this.deliveryComment,
    super.auditDetails,
  }):  super();

  
}
