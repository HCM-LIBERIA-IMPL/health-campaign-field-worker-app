// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class TaskResource extends Table {
  TextColumn get taskId => text().nullable()();
  TextColumn get taskClientReferenceId => text()();
  TextColumn get id => text()();
  TextColumn get productVariantId => text().nullable()();
  TextColumn get quantity => text().nullable()();
  BoolColumn get isDelivered => boolean().nullable()();
  TextColumn get deliveryComment => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  

  @override
  Set<Column> get primaryKey => { id,  };
}