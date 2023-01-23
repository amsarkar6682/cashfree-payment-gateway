import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GenTokenCall {
  static Future<ApiCallResponse> call({
    String? orderId = '',
    String? amount = '',
  }) {
    final body = '''
{
  "orderId": "${orderId}",
  "orderAmount": "${amount}",
  "orderCurrency": "INR"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'genToken',
      apiUrl: 'https://test.cashfree.com/api/v2/cftoken/order',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-client-id': '115771878beb9aaa95842a33c77511',
        'x-client-secret': 'a645070af099771a16bdf1987973b325edcd3642',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class VerifySignatureCall {
  static Future<ApiCallResponse> call({
    String? orderId = '',
    String? orderAmount = '',
    String? referenceId = '',
    String? txStatus = '',
    String? paymentMode = '',
    String? txMsg = '',
    String? txTime = '',
    String? signature = '',
    String? secretKey = '',
  }) {
    final body = '''
{
  "orderId": "${orderId}",
  "orderAmount": "${orderAmount}",
  "referenceId": "${referenceId}",
  "txStatus": "${txStatus}",
  "paymentMode": "${paymentMode}",
  "txMsg": "${txMsg}",
  "txTime": "${txTime}",
  "signature": "${signature}",
  "secretKey": "${secretKey}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'verifySignature',
      apiUrl: 'http://18.218.86.142/cashfree/signature/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic txStatus(dynamic response) => getJsonField(
        response,
        r'''$.txStatus''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
