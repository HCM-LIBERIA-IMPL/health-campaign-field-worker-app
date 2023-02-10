// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProductVariantSearchModel extends EntitySearchModel {
  final String? id;
  final String? productId;
  final String? sku;
  final String? variation;
  final String? clientReferenceId;
  final String? tenantId;
  
  ProductVariantSearchModel({
    this.id,
    this.productId,
    this.sku,
    this.variation,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class ProductVariantModel extends EntityModel implements ProductVariantSearchModel {
  
  @override
  final String? id;
  
  @override
  final String? productId;
  
  @override
  final String? sku;
  
  @override
  final String? variation;
  
  @override
  final String clientReferenceId;
  
  @override
  final String tenantId;
  final int rowVersion;
  

  ProductVariantModel({
    this.id,
    this.productId,
    this.sku,
    this.variation,
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    super.auditDetails,
  }):  super();

  ProductVariantCompanion get companion {
    return ProductVariantCompanion(
      id: Value(id),
      productId: Value(productId),
      sku: Value(sku),
      variation: Value(variation),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}
