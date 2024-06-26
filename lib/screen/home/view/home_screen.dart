import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/screen/home/provider/home_provider.dart';
import 'package:weatherapp/screen/nointernet/view/noInterNet_screen.dart';
import 'package:weatherapp/utils/shared_pref.dart';

import '../model/home_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

HomeProvider? providerR;
HomeProvider? providerW;
SearchController controller=SearchController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().checkInternet();
    context.read<HomeProvider>().getWeatherFromhelper();
    context.read<HomeProvider>().setTheme();
    context.read<HomeProvider>().getBookMark();
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        body: providerW!.isInternet == false
            ? const NointernetScreen()
            : FutureBuilder(
          future: providerW!.modal,
              builder: (BuildContext context, AsyncSnapshot<HomeModal?> snapshot) {
                HomeModal? modal=snapshot.data;
                if(snapshot.hasError)
                  {
                     return const Center(child: Text("Data Not Found"));
                  }
                else if(snapshot.hasData)
                  {
                    return Container(
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          end: Alignment.bottomRight,
                          begin: Alignment.topLeft,
                          colors: [
                            Color(0xff97ABFF),
                            Color(0xff123597),
                          ],
                        ),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SearchBar(
                                controller: controller,
                                hintText: "search",
                                trailing: [
                                  IconButton(
                                      onPressed: () {
                                        providerR!.searchData(controller.text);
                                      }, icon: const Icon(Icons.search))
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'detail',arguments: modal);
                                  },
                                  child:  Text(
                                    "${modal!.name}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      backgroundColor: Color(0xff97ABFF),
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      providerR!.setBookMark(modal.name!);
                                    },
                                    icon: const Icon(
                                      Icons.bookmark_add_outlined,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/img/location 1.png",
                                  height: 18,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Text(
                                  "Current Location",
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/img/partly_cloudy.png",
                                  height: 130,
                                  width: 135,
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                 Text(
                                  "${modal.modal!.temp}°",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 70.71),
                                )
                              ],
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Max : ${modal.modal!.temp_max}",
                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  "Min : ${modal.modal!.temp_min}",
                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/img/daily.png"),
                                const SizedBox(
                                  width: 6,
                                ),
                                Image.asset("assets/img/weekly.png"),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 9, left: 9, bottom: 9),
                                    margin: const EdgeInsets.only(
                                        top: 10, right: 9, left: 9, bottom: 9),
                                    height: 139,
                                    width: 65.85,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Now",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 16),
                                        ),
                                        Image.asset("assets/img/partly_cloudy.png"),
                                        const Text(
                                          "23 °",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 18),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 9, left: 9, bottom: 9),
                                    height: 139,
                                    width: 65.85,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "1pm",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 16),
                                        ),
                                        Image.asset("assets/img/partly_cloudy.png"),
                                        const Text(
                                          "23 °",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 18),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 9, left: 9, bottom: 9),
                                    height: 139,
                                    width: 65.85,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "3pm",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 16),
                                        ),
                                        Image.asset("assets/img/partly_cloudy.png"),
                                        const Text(
                                          "23 °",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 18),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 9, left: 9, bottom: 9),
                                    height: 139,
                                    width: 65.85,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "5pm",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 16),
                                        ),
                                        Image.asset("assets/img/partly_cloudy.png"),
                                        const Text(
                                          "23 °",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 18),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 9, left: 9, bottom: 9),
                                    height: 139,
                                    width: 65.85,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "6pm",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 16),
                                        ),
                                        Image.asset("assets/img/partly_cloudy.png"),
                                        const Text(
                                          "23 °",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 18),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 9, left: 9, bottom: 9),
                                    height: 139,
                                    width: 65.85,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "8pm",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 16),
                                        ),
                                        Image.asset("assets/img/partly_cloudy.png"),
                                        const Text(
                                          "23 °",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 18),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 9, left: 9, bottom: 9),
                                    margin: const EdgeInsets.only(
                                      right: 9,
                                    ),
                                    height: 139,
                                    width: 65.85,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "10pm",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 16),
                                        ),
                                        Image.asset("assets/img/partly_cloudy.png"),
                                        const Text(
                                          "23 °",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 18),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ClipRRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  margin: const EdgeInsets.all(12),
                                  height: 100,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset("assets/img/sun.png"),
                                          const Column(
                                            children: [
                                              Text(
                                                "Sunset",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              Text("5:51",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold))
                                            ],
                                          ),
                                          const Column(
                                            children: [
                                              Text(
                                                "Sunset",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              Text("5:51",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ClipRRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  margin: const EdgeInsets.all(12),
                                  height: 100,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset("assets/img/sun.png"),
                                          const Column(
                                            children: [
                                              Text(
                                                "Sunset",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              Text("5:51",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold))
                                            ],
                                          ),
                                          const Column(
                                            children: [
                                              Text(
                                                "Sunset",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              Text("5:51",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                return Center(child: const CircularProgressIndicator());
              },

            ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
            child: Column(
              children: [
                Image.asset(
                  "assets/img/pngwing.com (1).png",
                  height: 200,
                  width: 200,
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.sunny),
                  title: const Text("Theme Mode"),
                  trailing: Switch(
                    value: providerW!.themeMode!,
                    onChanged: (value) {
                      Bookmark b1=Bookmark();
                      b1.setThemeData(value);
                      providerR!.setTheme();
                    },
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, 'bookmark');
                  },
                  leading: const Icon(Icons.bookmarks_sharp),
                  title: const Text("Bookmarks"),
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.privacy_tip),
                  title: const Text("Privacy and Security"),
                ),
                const Divider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
