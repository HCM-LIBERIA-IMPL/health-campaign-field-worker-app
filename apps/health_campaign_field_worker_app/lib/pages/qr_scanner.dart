import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import '../../router/app_router.dart';
import '../../utils/utils.dart';

import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';
import '../../widgets/localized.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../blocs/scanner/scanner.dart';
import '../blocs/search_households/search_households.dart';
import '../vision_detector_views/detector_view.dart';
import '../vision_detector_views/painters/barcode_detector_painter.dart';

class QRScannerPage extends LocalizedStatefulWidget {
  final bool sinlgleValue;
  final int quantity;
  final bool isGS1code;
  final bool isEditEnabled;

  const QRScannerPage({
    super.key,
    super.appLocalizations,
    required this.quantity,
    required this.isGS1code,
    this.sinlgleValue = false,
    this.isEditEnabled = false,
  });

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends LocalizedState<QRScannerPage> {
  final BarcodeScanner _barcodeScanner = BarcodeScanner();
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  var _cameraLensDirection = CameraLensDirection.back;
  AudioPlayer player = AudioPlayer();
  QRViewController? controller;
  List<GS1Barcode> result = [];
  List<String> codes = [];
  bool manualcode = false;
  bool flashstatus = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final _resourceController = TextEditingController();
  bool submitButton = false;

  @override
  void initState() {
    if (!widget.isEditEnabled) {
      context.read<ScannerBloc>().add(const ScannerEvent.handleScanner([], []));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () {
        if (!submitButton) {
          context
              .read<ScannerBloc>()
              .add(const ScannerEvent.handleScanner([], []));

          return Future.value(true);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        body: BlocBuilder<ScannerBloc, ScannerState>(
          builder: (context, state) {
            return !manualcode
                ? Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          controller?.pauseCamera();
                          controller?.resumeCamera();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.green[300],
                          child: DetectorView(
                            title: 'Barcode Scanner',
                            customPaint: _customPaint,
                            text: _text,
                            onImage: _processImage,
                            initialCameraLensDirection: _cameraLensDirection,
                            onCameraLensDirectionChanged: (value) =>
                                _cameraLensDirection = value,
                          ),
                        ),
                      ),
                      Positioned(
                        top: kPadding * 2,
                        left: kPadding,
                        child: SizedBox(
                          // [TODO: Localization need to be added]
                          child: GestureDetector(
                            onTap: () async {
                              controller?.toggleFlash();
                              var status = await controller?.getFlashStatus();
                              if (status != null) {
                                setState(() {
                                  flashstatus = status;
                                });
                              }
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.flashlight_on,
                                  color: theme.colorScheme.secondary,
                                ),
                                Text(
                                  localizations.translate(
                                    flashstatus
                                        ? i18.deliverIntervention.flashOff
                                        : i18.deliverIntervention.flashOn,
                                  ),
                                  style: TextStyle(
                                    color: theme.colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // [TODO : Need move to constants]
                      Positioned(
                        top: kPadding * 8,
                        left: MediaQuery.of(context).size.width / 3,
                        width: 250,
                        height: 250,
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          // [TODO: Localization need to be added]
                          child: Text(
                            localizations.translate(
                              i18.deliverIntervention.scannerLabel,
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 2.4,
                        left: MediaQuery.of(context).size.width / 4.5,
                        width: 250,
                        height: 250,
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          // [TODO: Localization need to be added]
                          child: Text(
                            localizations.translate(
                              i18.deliverIntervention.manualScan,
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 3.3,
                        left: MediaQuery.of(context).size.width / 5.2,
                        width: 250,
                        height: 250,
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          // [TODO: Localization need to be added]

                          child: TextButton(
                            onPressed: () {
                              context.read<ScannerBloc>().add(
                                    const ScannerEvent.handleScanner(
                                      [],
                                      [],
                                    ),
                                  );
                              setState(() {
                                manualcode = true;
                              });
                            },
                            child: Text(
                              localizations.translate(
                                i18.deliverIntervention.manualEnterCode,
                              ),
                              style: TextStyle(
                                color: theme.colorScheme.secondary,
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        width: MediaQuery.of(context).size.width,
                        height: kPadding * 12,
                        child: DigitCard(
                          child: DigitElevatedButton(
                            child: Text(localizations
                                .translate(i18.common.coreCommonSubmit)),
                            onPressed: () async {
                              submitButton = true;
                              if (widget.isGS1code &&
                                  result.length < widget.quantity) {
                                buildDialog();
                              } else {
                                final bloc =
                                    context.read<SearchHouseholdsBloc>();

                                final scannerState =
                                    context.read<ScannerBloc>().state;

                                if (scannerState.qrcodes.isNotEmpty) {
                                  bloc.add(SearchHouseholdsEvent.searchByTag(
                                    tag: scannerState.qrcodes.last,
                                    projectId: context.projectId,
                                  ));
                                }
                                context.router.pop();
                              }
                            },
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: (kPadding * 8),
                        height: widget.isGS1code
                            ? state.barcodes.length < 10
                                ? (state.barcodes.length * 60) + 80
                                : MediaQuery.of(context).size.height / 2
                            : state.qrcodes.length < 10
                                ? (state.qrcodes.length * 60) + 80
                                : MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          margin: const EdgeInsets.all(kPadding),
                          width: 100,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: DigitTheme.instance.colorScheme.outline,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                ),
                                padding: const EdgeInsets.only(
                                  bottom: kPadding * 2,
                                  top: kPadding * 2,
                                  left: kPadding * 2,
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: widget.isGS1code
                                    ? Text(
                                        '${state.barcodes.length.toString()} ${localizations.translate(i18.deliverIntervention.resourcesScanned)}',
                                        style: theme.textTheme.headlineMedium,
                                      )
                                    : Text(
                                        '${state.qrcodes.length.toString()} ${localizations.translate(i18.deliverIntervention.resourcesScanned)}',
                                        style: theme.textTheme.headlineMedium,
                                      ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: widget.isGS1code
                                      ? state.barcodes.length
                                      : state.qrcodes.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      shape: const Border(),
                                      title: Container(
                                        height: kPadding * 6,
                                        decoration: BoxDecoration(
                                          color: DigitTheme
                                              .instance.colorScheme.background,
                                          border: Border.all(
                                            color: DigitTheme
                                                .instance.colorScheme.outline,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(4.0),
                                          ),
                                        ),
                                        padding: const EdgeInsets.all(kPadding),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                overflow: TextOverflow.ellipsis,
                                                widget.isGS1code
                                                    ? state
                                                        .barcodes[index]
                                                        .elements
                                                        .entries
                                                        .last
                                                        .value
                                                        .data
                                                        .toString()
                                                    : state.qrcodes[index]
                                                        .toString(),
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                bottom: kPadding,
                                              ),
                                              child: IconButton(
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () {
                                                  final bloc = context
                                                      .read<ScannerBloc>();
                                                  if (widget.isGS1code) {
                                                    result = List.from(
                                                      state.barcodes,
                                                    );
                                                    result.removeAt(index);
                                                    setState(() {
                                                      result = result;
                                                    });

                                                    bloc.add(
                                                      ScannerEvent
                                                          .handleScanner(
                                                        result,
                                                        state.qrcodes,
                                                      ),
                                                    );
                                                  } else {
                                                    codes = List.from(
                                                      state.qrcodes,
                                                    );
                                                    codes.removeAt(index);
                                                    setState(() {
                                                      codes = codes;
                                                    });

                                                    bloc.add(
                                                      ScannerEvent
                                                          .handleScanner(
                                                        state.barcodes,
                                                        codes,
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : DigitCard(
                    child: ScrollableContent(
                      header: GestureDetector(
                        onTap: () {
                          context.router.pop();
                          context.router.push(QRScannerRoute(
                            quantity: 1,
                            isGS1code: false,
                            sinlgleValue: true,
                            isEditEnabled: true,
                          ));
                          // setState(() {
                          //   manualcode = false;
                          // });
                        },
                        child: const Align(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.close),
                        ),
                      ),
                      footer: DigitElevatedButton(
                        child: Text(localizations.translate(
                          i18.deliverIntervention.saveScannedResource,
                        )),
                        onPressed: () async {
                          submitButton = true;
                          final bloc = context.read<ScannerBloc>();
                          codes.clear();
                          codes.add(_resourceController.value.text);
                          bloc.add(
                            ScannerEvent.handleScanner(
                              state.barcodes,
                              codes,
                            ),
                          );
                          if (widget.isGS1code &&
                              result.length < widget.quantity) {
                            buildDialog();
                          } else {
                            final bloc = context.read<SearchHouseholdsBloc>();
                            final scannerState =
                                context.read<ScannerBloc>().state;

                            if (scannerState.qrcodes.isNotEmpty || manualcode) {
                              bloc.add(SearchHouseholdsEvent.searchByTag(
                                tag: manualcode
                                    ? _resourceController.value.text
                                    : scannerState.qrcodes.last,
                                projectId: context.projectId,
                              ));
                            }
                            context.router.pop();
                          }
                        },
                      ),
                      children: [
                        Container(
                          padding: const EdgeInsets.all(kPadding),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              localizations.translate(
                                i18.deliverIntervention.manualEnterCode,
                              ),
                              style: theme.textTheme.headlineLarge,
                            ),
                          ),
                        ),
                        Text(localizations.translate(
                          i18.deliverIntervention.manualCodeDescription,
                        )),
                        DigitTextField(
                          label: localizations.translate(
                            i18.deliverIntervention.resourceCode,
                          ),
                          controller: _resourceController,
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }

  void buildDialog() async {
    await DigitDialog.show<bool>(
      context,
      options: DigitDialogOptions(
        titleText: localizations.translate(
          i18.deliverIntervention.scannerDialogTitle,
        ),
        contentText: localizations.translate(
          i18.deliverIntervention.scannerDialogContent,
        ),
        primaryAction: DigitDialogActions(
          label: localizations.translate(
            i18.deliverIntervention.scannerDialogPrimaryAction,
          ),
          action: (ctx) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).pop(false);
          },
        ),
        secondaryAction: DigitDialogActions(
          label: localizations.translate(
            i18.deliverIntervention.scannerDialogSecondaryAction,
          ),
          action: (ctx) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).pop(true);

            context.router.pop();
          },
        ),
      ),
    );
  }

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final barcodes = await _barcodeScanner.processImage(inputImage);

    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      if (barcodes.isNotEmpty) {
        final bloc = context.read<ScannerBloc>();
        if (widget.isGS1code) {
          try {
            final parser = GS1BarcodeParser.defaultParser();
            final parsedResult =
                parser.parse(barcodes.first.displayValue.toString());

            // TODO: temporarily commented
            // final alreadyScanned = bloc.state.barcodes.any((element) =>
            //     element.elements.entries.last.value.data ==
            //     parsedResult.elements.entries.last.value.data);

            if (widget.quantity > result.length) {
              await storeValue(parsedResult);
            } else {
              await handleError(
                i18.deliverIntervention.scannedResourceCountMisMatch,
              );
            }
          } catch (e) {
            await handleError(
              i18.deliverIntervention.scanValidResource,
            );
          }
        } else {
          if (bloc.state.qrcodes.contains(barcodes.first.displayValue)) {
            // TODO: temporarily commented
            // Future.delayed(const Duration(seconds: 10));
            // await handleError(
            //   i18.deliverIntervention.sameQrcodeScanned,
            // );
            // Future.delayed(const Duration(seconds: 3));

            return;
          } else {
            RegExp pattern =
                RegExp(r'^\d{4}-\d{2}-\d{2}-\d{1}-\d{3}-[a-zA-Z0-9]{5}$');

            if (pattern.hasMatch(barcodes.first.displayValue ?? "")) {
              await storeCode(barcodes.first.displayValue.toString());
              Future.delayed(const Duration(seconds: 3));
            } else {
              await handleError(
                i18.deliverIntervention.scanValidResource,
              );
            }
          }
        }
      }

      final painter = BarcodeDetectorPainter(
        barcodes,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
        _cameraLensDirection,
      );
      _customPaint = CustomPaint(painter: painter);
    } else {
      String text = 'Barcodes found: ${barcodes.length}\n\n';
      for (final barcode in barcodes) {
        text += 'Barcode: ${barcode.rawValue}\n\n';
      }
      _text = text;
      // TODO: set _customPaint to draw boundingRect on top of image
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

// need to remove this

  Future handleError(String message) async {
    player.play(AssetSource("audio/buzzer.wav"));

    if (player.state == PlayerState.completed || result.isEmpty) {
      DigitToast.show(
        context,
        options: DigitToastOptions(
          localizations.translate(message),
          true,
          Theme.of(context),
        ),
      );
    }
    Future.delayed(
      const Duration(seconds: 1),
    );
  }

  Future storeCode(
    String code,
  ) async {
    player.play(AssetSource("audio/add.wav"));
    final bloc = context.read<ScannerBloc>();
    codes = List.from(bloc.state.qrcodes);
    if (widget.sinlgleValue) {
      codes = [];
    }

    codes.add(code);

    setState(() {
      codes = codes;
    });

    bloc.add(ScannerEvent.handleScanner(
      bloc.state.barcodes,
      codes,
    ));

    return;
  }

  Future storeValue(
    GS1Barcode scanData,
  ) async {
    final parsedresult = scanData;
    final bloc = context.read<ScannerBloc>();

    player.play(AssetSource("audio/add.wav"));
    Future.delayed(const Duration(seconds: 3));

    result = List.from(bloc.state.barcodes);
    result.removeDuplicates(
      (element) => element.elements.entries.last.value.data,
    );

    result.add(parsedresult);
    bloc.add(ScannerEvent.handleScanner(result, bloc.state.qrcodes));
    setState(() {
      result = result;
    });
    Future.delayed(
      const Duration(seconds: 5),
    );

    return;
  }

  @override
  void dispose() {
    controller?.dispose();
    _barcodeScanner.close();
    super.dispose();
  }
}
