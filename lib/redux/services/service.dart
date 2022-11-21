import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:student_app/constants.dart';
import 'package:student_app/redux/model/welcome.dart';

class ApiService {
  Future<List<Welcome>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Welcome> _model = welcomeFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}