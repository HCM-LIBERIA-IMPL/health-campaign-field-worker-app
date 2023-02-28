import 'dart:async';
import 'dart:convert';

import 'package:digit_components/digit_components.dart';
import 'package:dio/dio.dart';

import '../../models/request_info/request_info_model.dart';
import '../../utils/constants.dart';
import '../local_store/secure_store/secure_store.dart';

class ApiInterceptors extends Interceptor {
  final LocalSecureStore localSecureStore;

  ApiInterceptors({
    LocalSecureStore? localSecureStore,
  }) : localSecureStore = localSecureStore ?? LocalSecureStore.instance;

  @override
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    AppLogger.instance.info(options.path, title: 'onRequest');
    final authToken = await localSecureStore.accessToken;

    if (options.data is Map) {
      AppLogger.instance.info(json.encode(options.data), title: options.path);

      options.data = {
        ...options.data,
        "RequestInfo": RequestInfoModel(
          apiId: RequestInfoData.apiId,
          ver: RequestInfoData.ver,
          ts: RequestInfoData.ts,
          action: options.path.split('/').last,
          did: RequestInfoData.did,
          key: RequestInfoData.key,
          authToken: authToken,
        ).toJson(),
      };
    }

    super.onRequest(options, handler);
  }
}
