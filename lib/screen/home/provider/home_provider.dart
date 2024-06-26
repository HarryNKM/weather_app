import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/utils/shared_pref.dart';

import '../../../utils/api_helper.dart';
import '../model/home_modal.dart';

class HomeProvider with ChangeNotifier {
  Connectivity connectivity = Connectivity();
  bool? isInternet = false;
  ApiHelper helper = ApiHelper();
  Future<HomeModal?>? modal;
  int? selectedINdex = 0;
  List<String> l1 = [];
  bool? themeMode = true;
  String? search = "Rajkot";
  Bookmark obj = Bookmark();

  Future<void> setBookMark(String name) async {
    List<String>? data = await obj.getBookMark();
    if (data != null) {
      data.add(name);
      obj.setBookMark(data);
    } else {
      obj.setBookMark([name]);
    }
    getBookMark();
    notifyListeners();
  }

  Future<void> getBookMark() async {
    var list = await obj.getBookMark();
    if (list != null) {
      l1 = list;
      notifyListeners();
    }
  }

  void deleteBookmark(int index)
  {
    l1.removeAt(index);
    notifyListeners();
  }

  void changeNavigationIndex(int index) {
    selectedINdex = index;
    notifyListeners();
  }

  void setTheme() async {
    themeMode = await getThemeData();
    notifyListeners();
  }

  void searchData(String? s) {
    search = s;
    getWeatherFromhelper();
    notifyListeners();
  }

  void getWeatherFromhelper() {
    modal = helper.getWeatherApi(q: search);
    modal!.then(
      (value) {
        if (value != null) {
          notifyListeners();
        }
      },
    );
  }

  void checkInternet() async {
    connectivity.onConnectivityChanged.listen(
      (event) {
        if (event.contains(ConnectivityResult.mobile) ||
            event.contains(ConnectivityResult.wifi)) {
          isInternet = true;
        } else {
          isInternet = false;
        }
        notifyListeners();
      },
    );
  }
}
