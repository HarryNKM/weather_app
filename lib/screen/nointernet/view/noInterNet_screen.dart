import 'package:flutter/material.dart';

class NointernetScreen extends StatelessWidget {
  const NointernetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          padding:
          const EdgeInsets.only(top: 30, ),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/img/no-internet.png",height: 200,width: 200,),
              SizedBox(height: 20,),
              Text("Oooops...",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
              SizedBox(
                height: 10,
              ),
              Text("No Internet Conncection",style: TextStyle(color: Colors.white,fontSize: 18),),
              SizedBox(height: 10,),
              Text("Check Your Internet Conncection",style: TextStyle(color: Colors.white,fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
