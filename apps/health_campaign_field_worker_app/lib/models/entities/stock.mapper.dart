// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'stock.dart';

class StockSearchModelMapper extends SubClassMapperBase<StockSearchModel> {
  StockSearchModelMapper._();

  static StockSearchModelMapper? _instance;
  static StockSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StockSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StockSearchModel';

  static String? _$id(StockSearchModel v) => v.id;
  static const Field<StockSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$tenantId(StockSearchModel v) => v.tenantId;
  static const Field<StockSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$facilityId(StockSearchModel v) => v.facilityId;
  static const Field<StockSearchModel, String> _f$facilityId =
      Field('facilityId', _$facilityId, opt: true);
  static String? _$productVariantId(StockSearchModel v) => v.productVariantId;
  static const Field<StockSearchModel, String> _f$productVariantId =
      Field('productVariantId', _$productVariantId, opt: true);
  static String? _$referenceId(StockSearchModel v) => v.referenceId;
  static const Field<StockSearchModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static String? _$referenceIdType(StockSearchModel v) => v.referenceIdType;
  static const Field<StockSearchModel, String> _f$referenceIdType =
      Field('referenceIdType', _$referenceIdType, opt: true);
  static String? _$transactingPartyId(StockSearchModel v) =>
      v.transactingPartyId;
  static const Field<StockSearchModel, String> _f$transactingPartyId =
      Field('transactingPartyId', _$transactingPartyId, opt: true);
  static String? _$transactingPartyType(StockSearchModel v) =>
      v.transactingPartyType;
  static const Field<StockSearchModel, String> _f$transactingPartyType =
      Field('transactingPartyType', _$transactingPartyType, opt: true);
  static String? _$receiverId(StockSearchModel v) => v.receiverId;
  static const Field<StockSearchModel, String> _f$receiverId =
      Field('receiverId', _$receiverId, opt: true);
  static String? _$receiverType(StockSearchModel v) => v.receiverType;
  static const Field<StockSearchModel, String> _f$receiverType =
      Field('receiverType', _$receiverType, opt: true);
  static String? _$senderId(StockSearchModel v) => v.senderId;
  static const Field<StockSearchModel, String> _f$senderId =
      Field('senderId', _$senderId, opt: true);
  static String? _$senderType(StockSearchModel v) => v.senderType;
  static const Field<StockSearchModel, String> _f$senderType =
      Field('senderType', _$senderType, opt: true);
  static List<String>? _$clientReferenceId(StockSearchModel v) =>
      v.clientReferenceId;
  static const Field<StockSearchModel, List<String>> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static List<TransactionType>? _$transactionType(StockSearchModel v) =>
      v.transactionType;
  static const Field<StockSearchModel, List<TransactionType>>
      _f$transactionType =
      Field('transactionType', _$transactionType, opt: true);
  static List<TransactionReason>? _$transactionReason(StockSearchModel v) =>
      v.transactionReason;
  static const Field<StockSearchModel, List<TransactionReason>>
      _f$transactionReason =
      Field('transactionReason', _$transactionReason, opt: true);
  static String? _$boundaryCode(StockSearchModel v) => v.boundaryCode;
  static const Field<StockSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AdditionalFields? _$additionalFields(StockSearchModel v) =>
      v.additionalFields;
  static const Field<StockSearchModel, AdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static AuditDetails? _$auditDetails(StockSearchModel v) => v.auditDetails;
  static const Field<StockSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);

  @override
  final MappableFields<StockSearchModel> fields = const {
    #id: _f$id,
    #tenantId: _f$tenantId,
    #facilityId: _f$facilityId,
    #productVariantId: _f$productVariantId,
    #referenceId: _f$referenceId,
    #referenceIdType: _f$referenceIdType,
    #transactingPartyId: _f$transactingPartyId,
    #transactingPartyType: _f$transactingPartyType,
    #receiverId: _f$receiverId,
    #receiverType: _f$receiverType,
    #senderId: _f$senderId,
    #senderType: _f$senderType,
    #clientReferenceId: _f$clientReferenceId,
    #transactionType: _f$transactionType,
    #transactionReason: _f$transactionReason,
    #boundaryCode: _f$boundaryCode,
    #additionalFields: _f$additionalFields,
    #auditDetails: _f$auditDetails,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      EntitySearchModelMapper.ensureInitialized();

  static StockSearchModel _instantiate(DecodingData data) {
    return StockSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        facilityId: data.dec(_f$facilityId),
        productVariantId: data.dec(_f$productVariantId),
        referenceId: data.dec(_f$referenceId),
        referenceIdType: data.dec(_f$referenceIdType),
        transactingPartyId: data.dec(_f$transactingPartyId),
        transactingPartyType: data.dec(_f$transactingPartyType),
        receiverId: data.dec(_f$receiverId),
        receiverType: data.dec(_f$receiverType),
        senderId: data.dec(_f$senderId),
        senderType: data.dec(_f$senderType),
        clientReferenceId: data.dec(_f$clientReferenceId),
        transactionType: data.dec(_f$transactionType),
        transactionReason: data.dec(_f$transactionReason),
        boundaryCode: data.dec(_f$boundaryCode),
        additionalFields: data.dec(_f$additionalFields),
        auditDetails: data.dec(_f$auditDetails));
  }

  @override
  final Function instantiate = _instantiate;

  static StockSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StockSearchModel>(map);
  }

  static StockSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<StockSearchModel>(json);
  }
}

mixin StockSearchModelMappable {
  String toJson() {
    return StockSearchModelMapper.ensureInitialized()
        .encodeJson<StockSearchModel>(this as StockSearchModel);
  }

  Map<String, dynamic> toMap() {
    return StockSearchModelMapper.ensureInitialized()
        .encodeMap<StockSearchModel>(this as StockSearchModel);
  }

  StockSearchModelCopyWith<StockSearchModel, StockSearchModel, StockSearchModel>
      get copyWith => _StockSearchModelCopyWithImpl(
          this as StockSearchModel, $identity, $identity);
  @override
  String toString() {
    return StockSearchModelMapper.ensureInitialized()
        .stringifyValue(this as StockSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            StockSearchModelMapper.ensureInitialized()
                .isValueEqual(this as StockSearchModel, other));
  }

  @override
  int get hashCode {
    return StockSearchModelMapper.ensureInitialized()
        .hashValue(this as StockSearchModel);
  }
}

extension StockSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StockSearchModel, $Out> {
  StockSearchModelCopyWith<$R, StockSearchModel, $Out>
      get $asStockSearchModel =>
          $base.as((v, t, t2) => _StockSearchModelCopyWithImpl(v, t, t2));
}

abstract class StockSearchModelCopyWith<$R, $In extends StockSearchModel, $Out>
    implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  ListCopyWith<$R, TransactionType,
          ObjectCopyWith<$R, TransactionType, TransactionType>>?
      get transactionType;
  ListCopyWith<$R, TransactionReason,
          ObjectCopyWith<$R, TransactionReason, TransactionReason>>?
      get transactionReason;
  @override
  AdditionalFieldsCopyWith<$R, AdditionalFields, AdditionalFields>?
      get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  $R call(
      {String? id,
      String? tenantId,
      String? facilityId,
      String? productVariantId,
      String? referenceId,
      String? referenceIdType,
      String? transactingPartyId,
      String? transactingPartyType,
      String? receiverId,
      String? receiverType,
      String? senderId,
      String? senderType,
      List<String>? clientReferenceId,
      List<TransactionType>? transactionType,
      List<TransactionReason>? transactionReason,
      String? boundaryCode,
      AdditionalFields? additionalFields,
      AuditDetails? auditDetails});
  StockSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StockSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StockSearchModel, $Out>
    implements StockSearchModelCopyWith<$R, StockSearchModel, $Out> {
  _StockSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StockSearchModel> $mapper =
      StockSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId => $value.clientReferenceId != null
          ? ListCopyWith(
              $value.clientReferenceId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(clientReferenceId: v))
          : null;
  @override
  ListCopyWith<$R, TransactionType,
          ObjectCopyWith<$R, TransactionType, TransactionType>>?
      get transactionType => $value.transactionType != null
          ? ListCopyWith(
              $value.transactionType!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(transactionType: v))
          : null;
  @override
  ListCopyWith<$R, TransactionReason,
          ObjectCopyWith<$R, TransactionReason, TransactionReason>>?
      get transactionReason => $value.transactionReason != null
          ? ListCopyWith(
              $value.transactionReason!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(transactionReason: v))
          : null;
  @override
  AdditionalFieldsCopyWith<$R, AdditionalFields, AdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  $R call(
          {Object? id = $none,
          Object? tenantId = $none,
          Object? facilityId = $none,
          Object? productVariantId = $none,
          Object? referenceId = $none,
          Object? referenceIdType = $none,
          Object? transactingPartyId = $none,
          Object? transactingPartyType = $none,
          Object? receiverId = $none,
          Object? receiverType = $none,
          Object? senderId = $none,
          Object? senderType = $none,
          Object? clientReferenceId = $none,
          Object? transactionType = $none,
          Object? transactionReason = $none,
          Object? boundaryCode = $none,
          Object? additionalFields = $none,
          Object? auditDetails = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (facilityId != $none) #facilityId: facilityId,
        if (productVariantId != $none) #productVariantId: productVariantId,
        if (referenceId != $none) #referenceId: referenceId,
        if (referenceIdType != $none) #referenceIdType: referenceIdType,
        if (transactingPartyId != $none)
          #transactingPartyId: transactingPartyId,
        if (transactingPartyType != $none)
          #transactingPartyType: transactingPartyType,
        if (receiverId != $none) #receiverId: receiverId,
        if (receiverType != $none) #receiverType: receiverType,
        if (senderId != $none) #senderId: senderId,
        if (senderType != $none) #senderType: senderType,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (transactionType != $none) #transactionType: transactionType,
        if (transactionReason != $none) #transactionReason: transactionReason,
        if (boundaryCode != $none) #boundaryCode: boundaryCode,
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (auditDetails != $none) #auditDetails: auditDetails
      }));
  @override
  StockSearchModel $make(CopyWithData data) => StockSearchModel.ignoreDeleted(
      id: data.get(#id, or: $value.id),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      facilityId: data.get(#facilityId, or: $value.facilityId),
      productVariantId:
          data.get(#productVariantId, or: $value.productVariantId),
      referenceId: data.get(#referenceId, or: $value.referenceId),
      referenceIdType: data.get(#referenceIdType, or: $value.referenceIdType),
      transactingPartyId:
          data.get(#transactingPartyId, or: $value.transactingPartyId),
      transactingPartyType:
          data.get(#transactingPartyType, or: $value.transactingPartyType),
      receiverId: data.get(#receiverId, or: $value.receiverId),
      receiverType: data.get(#receiverType, or: $value.receiverType),
      senderId: data.get(#senderId, or: $value.senderId),
      senderType: data.get(#senderType, or: $value.senderType),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      transactionType: data.get(#transactionType, or: $value.transactionType),
      transactionReason:
          data.get(#transactionReason, or: $value.transactionReason),
      boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode),
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails));

  @override
  StockSearchModelCopyWith<$R2, StockSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StockSearchModelCopyWithImpl($value, $cast, t);
}

class StockModelMapper extends SubClassMapperBase<StockModel> {
  StockModelMapper._();

  static StockModelMapper? _instance;
  static StockModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StockModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StockModel';

  static StockAdditionalFields? _$additionalFields(StockModel v) =>
      v.additionalFields;
  static const Field<StockModel, StockAdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(StockModel v) => v.id;
  static const Field<StockModel, String> _f$id = Field('id', _$id, opt: true);
  static String? _$tenantId(StockModel v) => v.tenantId;
  static const Field<StockModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$facilityId(StockModel v) => v.facilityId;
  static const Field<StockModel, String> _f$facilityId =
      Field('facilityId', _$facilityId, opt: true);
  static String? _$productVariantId(StockModel v) => v.productVariantId;
  static const Field<StockModel, String> _f$productVariantId =
      Field('productVariantId', _$productVariantId, opt: true);
  static String? _$referenceId(StockModel v) => v.referenceId;
  static const Field<StockModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static String? _$referenceIdType(StockModel v) => v.referenceIdType;
  static const Field<StockModel, String> _f$referenceIdType =
      Field('referenceIdType', _$referenceIdType, opt: true);
  static String? _$transactingPartyId(StockModel v) => v.transactingPartyId;
  static const Field<StockModel, String> _f$transactingPartyId =
      Field('transactingPartyId', _$transactingPartyId, opt: true);
  static String? _$transactingPartyType(StockModel v) => v.transactingPartyType;
  static const Field<StockModel, String> _f$transactingPartyType =
      Field('transactingPartyType', _$transactingPartyType, opt: true);
  static String? _$quantity(StockModel v) => v.quantity;
  static const Field<StockModel, String> _f$quantity =
      Field('quantity', _$quantity, opt: true);
  static String? _$waybillNumber(StockModel v) => v.waybillNumber;
  static const Field<StockModel, String> _f$waybillNumber =
      Field('waybillNumber', _$waybillNumber, opt: true);
  static String? _$receiverId(StockModel v) => v.receiverId;
  static const Field<StockModel, String> _f$receiverId =
      Field('receiverId', _$receiverId, opt: true);
  static String? _$receiverType(StockModel v) => v.receiverType;
  static const Field<StockModel, String> _f$receiverType =
      Field('receiverType', _$receiverType, opt: true);
  static String? _$senderId(StockModel v) => v.senderId;
  static const Field<StockModel, String> _f$senderId =
      Field('senderId', _$senderId, opt: true);
  static String? _$senderType(StockModel v) => v.senderType;
  static const Field<StockModel, String> _f$senderType =
      Field('senderType', _$senderType, opt: true);
  static bool? _$nonRecoverableError(StockModel v) => v.nonRecoverableError;
  static const Field<StockModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String _$clientReferenceId(StockModel v) => v.clientReferenceId;
  static const Field<StockModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static int? _$rowVersion(StockModel v) => v.rowVersion;
  static const Field<StockModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static TransactionType? _$transactionType(StockModel v) => v.transactionType;
  static const Field<StockModel, TransactionType> _f$transactionType =
      Field('transactionType', _$transactionType, opt: true);
  static TransactionReason? _$transactionReason(StockModel v) =>
      v.transactionReason;
  static const Field<StockModel, TransactionReason> _f$transactionReason =
      Field('transactionReason', _$transactionReason, opt: true);
  static AuditDetails? _$auditDetails(StockModel v) => v.auditDetails;
  static const Field<StockModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(StockModel v) =>
      v.clientAuditDetails;
  static const Field<StockModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(StockModel v) => v.isDeleted;
  static const Field<StockModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<StockModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #tenantId: _f$tenantId,
    #facilityId: _f$facilityId,
    #productVariantId: _f$productVariantId,
    #referenceId: _f$referenceId,
    #referenceIdType: _f$referenceIdType,
    #transactingPartyId: _f$transactingPartyId,
    #transactingPartyType: _f$transactingPartyType,
    #quantity: _f$quantity,
    #waybillNumber: _f$waybillNumber,
    #receiverId: _f$receiverId,
    #receiverType: _f$receiverType,
    #senderId: _f$senderId,
    #senderType: _f$senderType,
    #nonRecoverableError: _f$nonRecoverableError,
    #clientReferenceId: _f$clientReferenceId,
    #rowVersion: _f$rowVersion,
    #transactionType: _f$transactionType,
    #transactionReason: _f$transactionReason,
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
    #isDeleted: _f$isDeleted,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      EntityModelMapper.ensureInitialized();

  static StockModel _instantiate(DecodingData data) {
    return StockModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        facilityId: data.dec(_f$facilityId),
        productVariantId: data.dec(_f$productVariantId),
        referenceId: data.dec(_f$referenceId),
        referenceIdType: data.dec(_f$referenceIdType),
        transactingPartyId: data.dec(_f$transactingPartyId),
        transactingPartyType: data.dec(_f$transactingPartyType),
        quantity: data.dec(_f$quantity),
        waybillNumber: data.dec(_f$waybillNumber),
        receiverId: data.dec(_f$receiverId),
        receiverType: data.dec(_f$receiverType),
        senderId: data.dec(_f$senderId),
        senderType: data.dec(_f$senderType),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        clientReferenceId: data.dec(_f$clientReferenceId),
        rowVersion: data.dec(_f$rowVersion),
        transactionType: data.dec(_f$transactionType),
        transactionReason: data.dec(_f$transactionReason),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static StockModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StockModel>(map);
  }

  static StockModel fromJson(String json) {
    return ensureInitialized().decodeJson<StockModel>(json);
  }
}

mixin StockModelMappable {
  String toJson() {
    return StockModelMapper.ensureInitialized()
        .encodeJson<StockModel>(this as StockModel);
  }

  Map<String, dynamic> toMap() {
    return StockModelMapper.ensureInitialized()
        .encodeMap<StockModel>(this as StockModel);
  }

  StockModelCopyWith<StockModel, StockModel, StockModel> get copyWith =>
      _StockModelCopyWithImpl(this as StockModel, $identity, $identity);
  @override
  String toString() {
    return StockModelMapper.ensureInitialized()
        .stringifyValue(this as StockModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            StockModelMapper.ensureInitialized()
                .isValueEqual(this as StockModel, other));
  }

  @override
  int get hashCode {
    return StockModelMapper.ensureInitialized().hashValue(this as StockModel);
  }
}

extension StockModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StockModel, $Out> {
  StockModelCopyWith<$R, StockModel, $Out> get $asStockModel =>
      $base.as((v, t, t2) => _StockModelCopyWithImpl(v, t, t2));
}

abstract class StockModelCopyWith<$R, $In extends StockModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  StockAdditionalFieldsCopyWith<$R, StockAdditionalFields,
      StockAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {StockAdditionalFields? additionalFields,
      String? id,
      String? tenantId,
      String? facilityId,
      String? productVariantId,
      String? referenceId,
      String? referenceIdType,
      String? transactingPartyId,
      String? transactingPartyType,
      String? quantity,
      String? waybillNumber,
      String? receiverId,
      String? receiverType,
      String? senderId,
      String? senderType,
      bool? nonRecoverableError,
      String? clientReferenceId,
      int? rowVersion,
      TransactionType? transactionType,
      TransactionReason? transactionReason,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  StockModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StockModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StockModel, $Out>
    implements StockModelCopyWith<$R, StockModel, $Out> {
  _StockModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StockModel> $mapper =
      StockModelMapper.ensureInitialized();
  @override
  StockAdditionalFieldsCopyWith<$R, StockAdditionalFields,
          StockAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails => $value.clientAuditDetails?.copyWith
          .$chain((v) => call(clientAuditDetails: v));
  @override
  $R call(
          {Object? additionalFields = $none,
          Object? id = $none,
          Object? tenantId = $none,
          Object? facilityId = $none,
          Object? productVariantId = $none,
          Object? referenceId = $none,
          Object? referenceIdType = $none,
          Object? transactingPartyId = $none,
          Object? transactingPartyType = $none,
          Object? quantity = $none,
          Object? waybillNumber = $none,
          Object? receiverId = $none,
          Object? receiverType = $none,
          Object? senderId = $none,
          Object? senderType = $none,
          Object? nonRecoverableError = $none,
          String? clientReferenceId,
          Object? rowVersion = $none,
          Object? transactionType = $none,
          Object? transactionReason = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (facilityId != $none) #facilityId: facilityId,
        if (productVariantId != $none) #productVariantId: productVariantId,
        if (referenceId != $none) #referenceId: referenceId,
        if (referenceIdType != $none) #referenceIdType: referenceIdType,
        if (transactingPartyId != $none)
          #transactingPartyId: transactingPartyId,
        if (transactingPartyType != $none)
          #transactingPartyType: transactingPartyType,
        if (quantity != $none) #quantity: quantity,
        if (waybillNumber != $none) #waybillNumber: waybillNumber,
        if (receiverId != $none) #receiverId: receiverId,
        if (receiverType != $none) #receiverType: receiverType,
        if (senderId != $none) #senderId: senderId,
        if (senderType != $none) #senderType: senderType,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (transactionType != $none) #transactionType: transactionType,
        if (transactionReason != $none) #transactionReason: transactionReason,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  StockModel $make(CopyWithData data) => StockModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      facilityId: data.get(#facilityId, or: $value.facilityId),
      productVariantId:
          data.get(#productVariantId, or: $value.productVariantId),
      referenceId: data.get(#referenceId, or: $value.referenceId),
      referenceIdType: data.get(#referenceIdType, or: $value.referenceIdType),
      transactingPartyId:
          data.get(#transactingPartyId, or: $value.transactingPartyId),
      transactingPartyType:
          data.get(#transactingPartyType, or: $value.transactingPartyType),
      quantity: data.get(#quantity, or: $value.quantity),
      waybillNumber: data.get(#waybillNumber, or: $value.waybillNumber),
      receiverId: data.get(#receiverId, or: $value.receiverId),
      receiverType: data.get(#receiverType, or: $value.receiverType),
      senderId: data.get(#senderId, or: $value.senderId),
      senderType: data.get(#senderType, or: $value.senderType),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      transactionType: data.get(#transactionType, or: $value.transactionType),
      transactionReason:
          data.get(#transactionReason, or: $value.transactionReason),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  StockModelCopyWith<$R2, StockModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StockModelCopyWithImpl($value, $cast, t);
}

class StockAdditionalFieldsMapper
    extends SubClassMapperBase<StockAdditionalFields> {
  StockAdditionalFieldsMapper._();

  static StockAdditionalFieldsMapper? _instance;
  static StockAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StockAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StockAdditionalFields';

  static String _$schema(StockAdditionalFields v) => v.schema;
  static const Field<StockAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'Stock');
  static int _$version(StockAdditionalFields v) => v.version;
  static const Field<StockAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(StockAdditionalFields v) => v.fields;
  static const Field<StockAdditionalFields, List<AdditionalField>> _f$fields =
      Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<StockAdditionalFields> fields = const {
    #schema: _f$schema,
    #version: _f$version,
    #fields: _f$fields,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      AdditionalFieldsMapper.ensureInitialized();

  static StockAdditionalFields _instantiate(DecodingData data) {
    return StockAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static StockAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StockAdditionalFields>(map);
  }

  static StockAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<StockAdditionalFields>(json);
  }
}

mixin StockAdditionalFieldsMappable {
  String toJson() {
    return StockAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<StockAdditionalFields>(this as StockAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return StockAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<StockAdditionalFields>(this as StockAdditionalFields);
  }

  StockAdditionalFieldsCopyWith<StockAdditionalFields, StockAdditionalFields,
          StockAdditionalFields>
      get copyWith => _StockAdditionalFieldsCopyWithImpl(
          this as StockAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return StockAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as StockAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            StockAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as StockAdditionalFields, other));
  }

  @override
  int get hashCode {
    return StockAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as StockAdditionalFields);
  }
}

extension StockAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StockAdditionalFields, $Out> {
  StockAdditionalFieldsCopyWith<$R, StockAdditionalFields, $Out>
      get $asStockAdditionalFields =>
          $base.as((v, t, t2) => _StockAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class StockAdditionalFieldsCopyWith<
    $R,
    $In extends StockAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  StockAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StockAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StockAdditionalFields, $Out>
    implements StockAdditionalFieldsCopyWith<$R, StockAdditionalFields, $Out> {
  _StockAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StockAdditionalFields> $mapper =
      StockAdditionalFieldsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, AdditionalField,
          AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>>
      get fields => ListCopyWith($value.fields, (v, t) => v.copyWith.$chain(t),
          (v) => call(fields: v));
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields}) =>
      $apply(FieldCopyWithData({
        if (schema != null) #schema: schema,
        if (version != null) #version: version,
        if (fields != null) #fields: fields
      }));
  @override
  StockAdditionalFields $make(CopyWithData data) => StockAdditionalFields(
      schema: data.get(#schema, or: $value.schema),
      version: data.get(#version, or: $value.version),
      fields: data.get(#fields, or: $value.fields));

  @override
  StockAdditionalFieldsCopyWith<$R2, StockAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _StockAdditionalFieldsCopyWithImpl($value, $cast, t);
}
