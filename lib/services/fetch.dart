import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:secured_chat_app/services/rest_connector.dart';
import 'package:secured_chat_app/services/urls.dart';

class Fetch {
  getJwtToken() {
    return GetStorage().read('jwtToken');
  }

  login(String email, String password) async {
    Map body = {
      "email": email,
      "password": password,
    };
    var jsonBody = JsonEncoder().convert(body);
    var response = await RestConnector(
      domain + urlLogin,
      getJwtToken(),
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }
}