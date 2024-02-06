import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '../../../blocs/app_initialization/app_initialization.dart';
import '../../../blocs/facility/facility.dart';
import '../../../blocs/product_variant/product_variant.dart';
import '../../../blocs/record_stock/record_stock.dart';
import '../../../blocs/scanner/scanner.dart';
import '../../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../../models/data_model.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';
import '../facility_selection.dart';

class StockDetailsPage extends LocalizedStatefulWidget {
  const StockDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<StockDetailsPage> createState() => _StockDetailsPageState();
}

class _StockDetailsPageState extends LocalizedState<StockDetailsPage> {
  static const _transactingPartyKey = 'transactingParty';
  static const _transactionQuantityKey = 'quantity';
  static const _transactionReasonKey = 'transactionReason';
  static const _waybillNumberKey = 'waybillNumber';
  static const _waybillQuantityKey = 'waybillQuantity';
  static const _vehicleNumberKey = 'vehicleNumber';
  static const _typeOfTransportKey = 'typeOfTransport';
  static const _commentsKey = 'comments';
  late ProductVariantModel productVariantModel;
  bool transportbyHand = false;

  FormGroup _form() {
    return fb.group({
      _transactingPartyKey: FormControl<FacilityModel>(
        validators: [Validators.required],
      ),
      _transactionQuantityKey: FormControl<int>(validators: [
        Validators.number,
        Validators.min(0),
        Validators.max(context.maximumQuantity),
      ]),
      _transactionReasonKey: FormControl<TransactionReason>(),
      _waybillNumberKey: FormControl<String>(
        validators: [
          Validators.required,
          CustomValidator.requiredMin,
        ],
      ),
      _waybillQuantityKey: FormControl<int>(
        validators: [
          Validators.number,
          Validators.min(0),
          Validators.max(context.maximumQuantity),
        ],
      ),
      _vehicleNumberKey: FormControl<String>(
        validators: [
          CustomValidator.requiredMin,
        ],
      ),
      _typeOfTransportKey: FormControl<String>(),
      _commentsKey: FormControl<String>(
        validators: [
          CustomValidator.requiredMin,
        ],
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, locationState) {
          return BlocConsumer<RecordStockBloc, RecordStockState>(
            listener: (context, stockState) {
              stockState.mapOrNull(
                persisted: (value) {
                  final parent = context.router.parent() as StackRouter;
                  parent.replace(AcknowledgementRoute());
                },
              );
            },
            builder: (context, stockState) {
              StockRecordEntryType entryType = stockState.entryType;
              const module = i18.stockDetails;

              String pageTitle;
              String transactionPartyLabel;
              String quantityCountLabel;
              String? transactionReasonLabel;
              TransactionType transactionType;
              TransactionReason? transactionReason;

              List<TransactionReason>? reasons;

              switch (entryType) {
                case StockRecordEntryType.receipt:
                  pageTitle = module.receivedPageTitle;
                  transactionPartyLabel = module.selectTransactingPartyReceived;
                  quantityCountLabel = module.quantityReceivedLabel;
                  transactionType = TransactionType.received;
                  break;
                case StockRecordEntryType.dispatch:
                  pageTitle = module.issuedPageTitle;
                  transactionPartyLabel = module.selectTransactingPartyIssued;
                  quantityCountLabel = module.quantitySentLabel;
                  transactionType = TransactionType.dispatched;
                  break;
                case StockRecordEntryType.returned:
                  pageTitle = module.returnedPageTitle;
                  transactionPartyLabel = module.selectTransactingPartyReturned;
                  quantityCountLabel = module.quantityReturnedLabel;
                  transactionType = TransactionType.received;
                  break;
                case StockRecordEntryType.loss:
                  pageTitle = module.lostPageTitle;
                  transactionPartyLabel =
                      module.selectTransactingPartyReceivedFromLost;
                  quantityCountLabel = module.quantityLostLabel;
                  transactionType = TransactionType.dispatched;
                  transactionReasonLabel = module.transactionReasonLost;
                  reasons = [
                    TransactionReason.lostInStorage,
                    TransactionReason.lostInTransit,
                  ];
                  break;
                case StockRecordEntryType.gained:
                  pageTitle = module.gainedPageTitle;
                  transactionPartyLabel =
                      module.selectTransactingPartyReceivedFromGained;
                  quantityCountLabel = module.quantityGainedLabel;
                  transactionType = TransactionType.received;
                  transactionReasonLabel = module.transactionReasonGained;
                  reasons = [
                    TransactionReason.gainedInStorage,
                    TransactionReason.gainedInTransit,
                  ];
                  break;
                case StockRecordEntryType.damaged:
                  pageTitle = module.damagedSpaqDetails;
                  transactionPartyLabel =
                      module.selectTransactingPartyReceivedFromDamaged;
                  quantityCountLabel = module.quantityDamagedLabel;
                  transactionType = TransactionType.dispatched;
                  transactionReasonLabel = module.transactionReasonDamaged;
                  reasons = [
                    TransactionReason.damagedInStorage,
                    TransactionReason.damagedInTransit,
                  ];
                  break;
              }

              transactionReasonLabel ??= '';

              return ReactiveFormBuilder(
                form: _form,
                builder: (context, form, child) {
                  return BlocBuilder<ProductVariantBloc, ProductVariantState>(
                    builder: (context, productState) {
                      return productState.maybeWhen(
                        orElse: () => const Offstage(),
                        fetched: (productVariants) {
                          productVariantModel = productVariants[0];

                          return ScrollableContent(
                            header: const Column(children: [
                              BackNavigationHelpHeaderWidget(),
                            ]),
                            footer: SizedBox(
                              height: 85,
                              child: DigitCard(
                                margin: const EdgeInsets.only(
                                  left: 0,
                                  right: 0,
                                  top: 10,
                                ),
                                child: ReactiveFormConsumer(
                                  builder: (context, form, child) =>
                                      DigitElevatedButton(
                                    onPressed: !form.valid
                                        ? null
                                        : () async {
                                            form.markAllAsTouched();
                                            if (!form.valid) {
                                              return;
                                            }

                                            final List<AdditionalField>
                                                additionalFields = [];
                                            final scannerState = context
                                                .read<ScannerBloc>()
                                                .state;
                                            if (scannerState
                                                .barcodes.isNotEmpty) {
                                              for (var element
                                                  in scannerState.barcodes) {
                                                List<String> keys = [];
                                                List<String> values = [];
                                                for (var e in element
                                                    .elements.entries) {
                                                  e.value.rawData;
                                                  keys.add(e.key.toString());
                                                  values.add(
                                                    e.value.data.toString(),
                                                  );
                                                }

                                                additionalFields.add(
                                                  AdditionalField(
                                                    keys.join('|'),
                                                    values.join('|'),
                                                  ),
                                                );
                                              }
                                            }

                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();

                                            final bloc =
                                                context.read<RecordStockBloc>();

                                            final productVariant =
                                                productVariantModel;

                                            switch (entryType) {
                                              case StockRecordEntryType.receipt:
                                                transactionReason =
                                                    TransactionReason.received;
                                                break;
                                              case StockRecordEntryType
                                                    .dispatch:
                                                transactionReason = null;
                                                break;
                                              case StockRecordEntryType
                                                    .returned:
                                                transactionReason =
                                                    TransactionReason.returned;
                                                break;
                                              default:
                                                transactionReason = form
                                                        .control(
                                                          _transactionReasonKey,
                                                        )
                                                        .value
                                                    as TransactionReason?;
                                                break;
                                            }

                                            final transactingParty = form
                                                .control(_transactingPartyKey)
                                                .value as FacilityModel;

                                            final quantity = form
                                                .control(
                                                  _transactionQuantityKey,
                                                )
                                                .value;

                                            final waybillNumber = form
                                                .control(_waybillNumberKey)
                                                .value as String?;

                                            final waybillQuantity = form
                                                .control(_waybillQuantityKey)
                                                .value;

                                            final vehicleNumber = form
                                                .control(_vehicleNumberKey)
                                                .value as String?;

                                            final transportType = form
                                                .control(_typeOfTransportKey)
                                                .value as String?;

                                            final lat = locationState.latitude;
                                            final lng = locationState.longitude;

                                            final hasLocationData =
                                                lat != null && lng != null;

                                            final comments = form
                                                .control(_commentsKey)
                                                .value as String?;

                                            String? transactingPartyType;

                                            final fields = transactingParty
                                                .additionalFields?.fields;

                                            if (fields != null &&
                                                fields.isNotEmpty) {
                                              final type =
                                                  fields.firstWhereOrNull(
                                                (element) =>
                                                    element.key == 'type',
                                              );
                                              final value = type?.value;
                                              if (value != null &&
                                                  value is String &&
                                                  value.isNotEmpty) {
                                                transactingPartyType = value;
                                              }
                                            }

                                            transactingPartyType ??=
                                                'WAREHOUSE';

                                            if (waybillQuantity != null) {
                                              additionalFields
                                                  .add(AdditionalField(
                                                'waybill_quantity',
                                                waybillQuantity.toString(),
                                              ));
                                            }

                                            if (vehicleNumber != null) {
                                              additionalFields
                                                  .add(AdditionalField(
                                                'vehicle_number',
                                                vehicleNumber,
                                              ));
                                            }

                                            if (comments != null) {
                                              additionalFields
                                                  .add(AdditionalField(
                                                'comments',
                                                comments,
                                              ));
                                            }
                                            if (transportType != null) {
                                              additionalFields
                                                  .add(AdditionalField(
                                                'transport_type',
                                                transportType,
                                              ));
                                            }
                                            if (hasLocationData) {
                                              additionalFields.add(
                                                AdditionalField('lat', lat),
                                              );
                                              additionalFields.add(
                                                AdditionalField('lng', lng),
                                              );
                                            }

                                            final stockModel = StockModel(
                                              clientReferenceId:
                                                  IdGen.i.identifier,
                                              productVariantId:
                                                  productVariant.id,
                                              transactingPartyId:
                                                  transactingParty.id,
                                              transactingPartyType:
                                                  transactingPartyType,
                                              transactionType: transactionType,
                                              transactionReason:
                                                  transactionReason,
                                              referenceId: stockState.projectId,
                                              referenceIdType: 'PROJECT',
                                              quantity: quantity.toString(),
                                              waybillNumber: waybillNumber,
                                              auditDetails: AuditDetails(
                                                createdBy:
                                                    context.loggedInUserUuid,
                                                createdTime: context
                                                    .millisecondsSinceEpoch(),
                                              ),
                                              clientAuditDetails:
                                                  ClientAuditDetails(
                                                createdBy:
                                                    context.loggedInUserUuid,
                                                createdTime: context
                                                    .millisecondsSinceEpoch(),
                                                lastModifiedBy:
                                                    context.loggedInUserUuid,
                                                lastModifiedTime: context
                                                    .millisecondsSinceEpoch(),
                                              ),
                                              additionalFields: additionalFields
                                                      .isNotEmpty
                                                  ? StockAdditionalFields(
                                                      version: 1,
                                                      fields: additionalFields,
                                                    )
                                                  : null,
                                            );

                                            bloc.add(
                                              RecordStockSaveStockDetailsEvent(
                                                stockModel: stockModel,
                                              ),
                                            );

                                            final submit =
                                                await DigitDialog.show<bool>(
                                              context,
                                              options: DigitDialogOptions(
                                                titleText:
                                                    localizations.translate(
                                                  i18.stockDetails.dialogTitle,
                                                ),
                                                contentText:
                                                    localizations.translate(
                                                  i18.stockDetails
                                                      .dialogContent,
                                                ),
                                                primaryAction:
                                                    DigitDialogActions(
                                                  label:
                                                      localizations.translate(
                                                    i18.common.coreCommonSubmit,
                                                  ),
                                                  action: (context) {
                                                    Navigator.of(
                                                      context,
                                                      rootNavigator: true,
                                                    ).pop(true);
                                                  },
                                                ),
                                                secondaryAction:
                                                    DigitDialogActions(
                                                  label:
                                                      localizations.translate(
                                                    i18.common.coreCommonCancel,
                                                  ),
                                                  action: (context) =>
                                                      Navigator.of(
                                                    context,
                                                    rootNavigator: true,
                                                  ).pop(false),
                                                ),
                                              ),
                                            );

                                            if (submit ?? false) {
                                              bloc.add(
                                                const RecordStockCreateStockEntryEvent(),
                                              );
                                            }
                                          },
                                    child: Center(
                                      child: Text(
                                        localizations.translate(
                                          i18.common.coreCommonSubmit,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            children: [
                              DigitCard(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      localizations.translate(pageTitle),
                                      style: theme.textTheme.displayMedium,
                                    ),

                                    if ([
                                      StockRecordEntryType.loss,
                                      StockRecordEntryType.gained,
                                      StockRecordEntryType.damaged,
                                    ].contains(entryType))
                                      DigitReactiveDropdown<TransactionReason>(
                                        label: localizations.translate(
                                          transactionReasonLabel ?? 'Reason',
                                        ),
                                        menuItems: reasons ?? [],
                                        formControlName: _transactionReasonKey,
                                        valueMapper: (value) {
                                          return localizations.translate(
                                            value.toValue(),
                                          );
                                        },
                                        isRequired: true,
                                      ),
                                    BlocBuilder<FacilityBloc, FacilityState>(
                                      builder: (context, state) {
                                        final unSortedFacilities =
                                            state.whenOrNull(
                                                  fetched:
                                                      (_, facilities, __) =>
                                                          facilities,
                                                ) ??
                                                [];

                                        var facilities =
                                            unSortedFacilities.toList();
                                        facilities.sort((a, b) =>
                                            (b.auditDetails?.lastModifiedTime ??
                                                    0)
                                                .compareTo(
                                              (a.auditDetails
                                                      ?.lastModifiedTime ??
                                                  0),
                                            ));

                                        return DigitTextFormField(
                                          valueAccessor: FacilityValueAccessor(
                                            facilities,
                                          ),
                                          label: localizations.translate(
                                            '${pageTitle}_${i18.stockReconciliationDetails.stockLabel}',
                                          ),
                                          isRequired: true,
                                          suffix: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(Icons.search),
                                          ),
                                          formControlName: _transactingPartyKey,
                                          readOnly: true,
                                          onTap: () async {
                                            final parent = context.router
                                                .parent() as StackRouter;
                                            final facility = await parent
                                                .push<FacilityModel>(
                                              FacilitySelectionRoute(
                                                facilities: facilities,
                                              ),
                                            );

                                            if (facility == null) return;
                                            form
                                                .control(_transactingPartyKey)
                                                .value = facility;
                                          },
                                        );
                                      },
                                    ),
                                    DigitTextFormField(
                                      formControlName: _transactionQuantityKey,
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                      isRequired: true,
                                      validationMessages: {
                                        "number": (object) =>
                                            localizations.translate(
                                              '${quantityCountLabel}_VALIDATION',
                                            ),
                                        "max": (object) =>
                                            "${localizations.translate(
                                              '${quantityCountLabel}_MAX_ERROR',
                                            )} ${context.maximumQuantity}",
                                        "min": (object) =>
                                            localizations.translate(
                                              '${quantityCountLabel}_MIN_ERROR',
                                            ),
                                      },
                                      label: localizations.translate(
                                        quantityCountLabel,
                                      ),
                                      onChanged: (control) {
                                        final quantity = form
                                            .control(
                                              _transactionQuantityKey,
                                            )
                                            .value as int?;
                                        final waybillQuantity = form
                                            .control(_waybillQuantityKey)
                                            .value as int?;
                                        if (quantity != waybillQuantity) {
                                          setState(() {
                                            form
                                                .control(
                                              _commentsKey,
                                            )
                                                .setValidators(
                                              [
                                                Validators.required,
                                                CustomValidator.requiredMin,
                                              ],
                                              updateParent: true,
                                              autoValidate: true,
                                            );
                                            form
                                                .control(
                                                  _commentsKey,
                                                )
                                                .touched;
                                          });
                                        } else {
                                          setState(() {
                                            form
                                                .control(
                                              _commentsKey,
                                            )
                                                .setValidators(
                                              [
                                                CustomValidator.requiredMin,
                                              ],
                                              updateParent: true,
                                              autoValidate: true,
                                            );
                                          });
                                        }
                                      },
                                    ),
                                    DigitTextFormField(
                                      label: localizations.translate(
                                        i18.stockDetails.waybillNumberLabel,
                                      ),
                                      formControlName: _waybillNumberKey,
                                      isRequired: true,
                                      validationMessages: {
                                        "required": (object) =>
                                            localizations.translate(
                                              i18.common.corecommonRequired,
                                            ),
                                        "min2": (object) =>
                                            localizations.translate(
                                              i18.common.min2CharsRequired,
                                            ),
                                      },
                                    ),
                                    DigitTextFormField(
                                      keyboardType: TextInputType.number,
                                      label: localizations.translate(
                                        i18.stockDetails
                                            .quantityOfProductIndicatedOnWaybillLabel,
                                      ),
                                      formControlName: _waybillQuantityKey,
                                      isRequired: true,
                                      validationMessages: {
                                        "number": (object) =>
                                            localizations.translate(
                                              '${quantityCountLabel}_VALIDATION',
                                            ),
                                        "max": (object) =>
                                            "${localizations.translate(
                                              '${quantityCountLabel}_MAX_ERROR',
                                            )} ${context.maximumQuantity}",
                                        "min": (object) =>
                                            localizations.translate(
                                              '${quantityCountLabel}_MIN_ERROR',
                                            ),
                                      },
                                      onChanged: (control) {
                                        final quantity = form
                                            .control(
                                              _transactionQuantityKey,
                                            )
                                            .value as int?;
                                        final waybillQuantity = form
                                            .control(_waybillQuantityKey)
                                            .value as int?;
                                        if (quantity != waybillQuantity) {
                                          setState(() {
                                            form
                                                .control(
                                              _commentsKey,
                                            )
                                                .setValidators(
                                              [
                                                Validators.required,
                                                CustomValidator.requiredMin,
                                              ],
                                              updateParent: true,
                                              autoValidate: true,
                                            );
                                            form
                                                .control(
                                                  _commentsKey,
                                                )
                                                .touched;
                                          });
                                        } else {
                                          setState(() {
                                            form
                                                .control(
                                              _commentsKey,
                                            )
                                                .setValidators(
                                              [
                                                CustomValidator.requiredMin,
                                              ],
                                              updateParent: true,
                                              autoValidate: true,
                                            );
                                          });
                                        }
                                      },
                                    ),
                                    BlocBuilder<AppInitializationBloc,
                                        AppInitializationState>(
                                      builder: (context, state) =>
                                          state.maybeWhen(
                                        orElse: () => const Offstage(),
                                        initialized: (appConfiguration, _) {
                                          final transportTypeOptions =
                                              appConfiguration.transportTypes ??
                                                  <TransportTypes>[];

                                          return DigitReactiveDropdown<String>(
                                            isRequired: false,
                                            label: localizations.translate(
                                              i18.stockDetails
                                                  .transportTypeLabel,
                                            ),
                                            valueMapper: (e) =>
                                                localizations.translate(e),
                                            onChanged: (value) {
                                              if (value == 'IN_HAND' ||
                                                  value == 'BY_CANOE') {
                                                setState(() {
                                                  form
                                                      .control(
                                                    _vehicleNumberKey,
                                                  )
                                                      .setValidators(
                                                    [],
                                                    updateParent: true,
                                                    autoValidate: true,
                                                  );
                                                  transportbyHand = true;
                                                });
                                              } else {
                                                setState(() {
                                                  transportbyHand = false;
                                                  form
                                                      .control(
                                                    _vehicleNumberKey,
                                                  )
                                                      .setValidators(
                                                    [
                                                      CustomValidator
                                                          .requiredMin,
                                                    ],
                                                    updateParent: true,
                                                    autoValidate: true,
                                                  );
                                                });
                                              }
                                            },
                                            initialValue: transportTypeOptions
                                                .firstOrNull?.name,
                                            menuItems: transportTypeOptions.map(
                                              (e) {
                                                return e.code;
                                              },
                                            ).toList(),
                                            formControlName:
                                                _typeOfTransportKey,
                                          );
                                        },
                                      ),
                                    ),
                                    transportbyHand
                                        ? const Offstage()
                                        : DigitTextFormField(
                                            label: localizations.translate(
                                              i18.stockDetails
                                                  .vehicleNumberLabel,
                                            ),
                                            formControlName: _vehicleNumberKey,
                                            validationMessages: {
                                              "min2": (object) =>
                                                  localizations.translate(
                                                    i18.common
                                                        .min2CharsRequired,
                                                  ),
                                            },
                                          ),
                                    DigitTextFormField(
                                      label: localizations.translate(
                                        i18.stockDetails.commentsLabel,
                                      ),
                                      minLines: 2,
                                      maxLines: 3,
                                      formControlName: _commentsKey,
                                      validationMessages: {
                                        "required": (object) =>
                                            localizations.translate(
                                              i18.common.corecommonRequired,
                                            ),
                                        "min2": (object) =>
                                            localizations.translate(
                                              i18.common.min2CharsRequired,
                                            ),
                                      },
                                    ),
                                    // Commenting this because we need this functionality for other APK

                                    // DigitOutlineIconButton(
                                    //   buttonStyle: OutlinedButton.styleFrom(
                                    //     shape: const RoundedRectangleBorder(
                                    //       borderRadius: BorderRadius.zero,
                                    //     ),
                                    //   ),
                                    //   onPressed: () {
                                    //     context.router.push(QRScannerRoute(
                                    //       quantity: 5,
                                    //       isGS1code: true,
                                    //       sinlgleValue: false,
                                    //     ));
                                    //   },
                                    //   icon: Icons.qr_code,
                                    //   label: localizations.translate(
                                    //     i18.common.scanBales,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
