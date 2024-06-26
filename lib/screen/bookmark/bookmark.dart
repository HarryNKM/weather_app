import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/screen/home/provider/home_provider.dart';

import '../home/model/home_modal.dart';
import '../nointernet/view/noInterNet_screen.dart';

class BookMark extends StatefulWidget {
  const BookMark({super.key});

  @override
  State<BookMark> createState() => _BookMarkState();
}

HomeProvider? providerR;
HomeProvider? providerW;

class _BookMarkState extends State<BookMark> {
  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return SafeArea(
        child: Scaffold(
      body: providerW!.isInternet == false
          ? const NointernetScreen()
          : FutureBuilder(
              future: providerW!.modal,
              builder:
                  (BuildContext context, AsyncSnapshot<HomeModal?> snapshot) {
                HomeModal? modal = snapshot.data;
                if (snapshot.hasError) {
                  return const Center(child: Text("Data Not Found"));
                } else if (snapshot.hasData) {
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                )),
                            const Text(
                              "BookMarks",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ],
                        ),
                        const Divider(),
                        Expanded(
                          child: ListView.builder(
                            itemCount: providerW!.l1.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(12),
                                height: 100,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      providerW!.l1[index],
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Image.asset("assets/img/partly_cloudy.png"),
                                    IconButton(
                                        onPressed: () {
                                          providerR!.deleteBookmark(index);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ))
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              }),
    ));
  }
}
