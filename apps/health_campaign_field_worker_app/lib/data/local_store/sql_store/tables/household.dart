// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Household extends Table {
  TextColumn get id => text().nullable()();
  IntColumn get memberCount => integer().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}