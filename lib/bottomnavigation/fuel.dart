import 'package:flutter/material.dart';

class Fuel extends StatefulWidget {
  const Fuel({super.key});

  @override
  State<Fuel> createState() => _FuelState();
}

class _FuelState extends State<Fuel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text('Fuel',style: TextStyle(fontSize: 25),),
          ),
          SizedBox(height: 300,),

          Center(
            child: Text('Comming Soon....', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}
