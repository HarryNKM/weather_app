import 'dart:convert';

import 'package:http/http.dart' as http;

import '../screen/home/model/home_modal.dart';

class ApiHelper {
  Future<HomeModal?> getWeatherApi({required String? q}) async {
    String link =
        "https://api.openweathermap.org/data/2.5/weather?q=$q&appid=f328d45c82255838461c68c2ab810685";
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      HomeModal modal = HomeModal.mapToModal(json);
      return modal;
    }
    return null;
  }
}
