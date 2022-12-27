import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/baseapiservice.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internat connection');
    }
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internat connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'error occured while communicating with server' +
                response.statusCode.toString());
    }
  }
}
