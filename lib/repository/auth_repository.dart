import 'package:mvvm/data/network/baseapiservice.dart';
import 'package:mvvm/data/network/networkapiservice.dart';
import 'package:mvvm/res/AppUrls.dart';
import 'package:mvvm/view_model/authview_model.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrls.loginApiEndPoint, data);
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> SignupApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrls.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
