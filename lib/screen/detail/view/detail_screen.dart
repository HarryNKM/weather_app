import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/screen/home/model/home_modal.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    HomeModal modal = ModalRoute.of(context)!.settings.arguments as HomeModal;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.only(
            top: 30,
            left: 12,
            right: 12,
            bottom: 12,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  Text(
                    "${modal.name}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  Image.asset(
                    "assets/img/partly_cloudy.png",
                    height: 56,
                    width: 58.56,
                  ),
                  Text(
                    "${modal.modal!.temp}°",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset("assets/img/Sunset Details.png"),
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(12),
                    height: 230,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Summary",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "See All",
                              style: TextStyle(color: Colors.black45),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/img/thermometer.png",
                                  height: 25,
                                  width: 25,
                                  color: Colors.white,
                                ),
                                const Text(
                                  "Max/Min",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "${modal.modal!.temp_max}\n${modal.modal!.temp_min}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/img/wind.png",
                                  height: 25,
                                  width: 25,
                                  color: Colors.white,
                                ),
                                const Text(
                                  "Haze",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "${modal.modal1!.speed}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/img/cloud.png",
                                  height: 25,
                                  width: 25,
                                  color: Colors.white,
                                ),
                                Text(
                                  "${modal.modal!.pressure}",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/img/tide.png",
                                  height: 25,
                                  width: 25,
                                  color: Colors.white,
                                ),
                                Text(
                                  "${modal.modal!.sea_level}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/img/level.png",
                                  height: 25,
                                  width: 25,
                                  color: Colors.white,
                                ),
                                 Text(
                                  "${modal.modal!.grnd_level}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/img/water.png",
                                  height: 25,
                                  width: 25,
                                  color: Colors.white,
                                ),
                                 Text(
                                  "${modal.modal!.humidity}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 300,
                  width: MediaQuery.sizeOf(context).width,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(
                    "assets/img/map.png",
                    fit: BoxFit.cover,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
