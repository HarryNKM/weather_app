import 'package:shared_preferences/shared_preferences.dart';
class Bookmark {
  Future<void> setBookMark(List<String> l1) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setStringList('bookmark', l1);
  }

  Future<List<String>?>? getBookMark() async {
    List<String>? data = [];
    SharedPreferences shr = await SharedPreferences.getInstance();
    data = shr.getStringList(
        'bookmark'
    );
    return data;
  }

  void setThemeData(bool themeData) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setBool('true', themeData);
  }
}


Future<bool> getThemeData() async {
  bool? data;

  SharedPreferences shr = await SharedPreferences.getInstance();
  data = shr.getBool('true');
  return data!;
}