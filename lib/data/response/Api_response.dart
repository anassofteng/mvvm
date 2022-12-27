import 'dart:html';

import 'package:mvvm/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.Loading;
  ApiResponse.compeleted() : status = Status.Compeleted;
  ApiResponse.error() : status = Status.Error;

  @override
  String toString() {
    return "status : $status \n Message : $message \n Data: $data";
  }
}
