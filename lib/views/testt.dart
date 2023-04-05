import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Testt extends StatefulWidget {
  const Testt({super.key});

  @override
  State<Testt> createState() => _TesttState();
}

class _TesttState extends State<Testt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            
            Container(
              height: 180,
              child: ListView(children: [
                Text("data",style: TextStyle(color: Colors.green),),
                Container(
                height: 40,
                width: 50,
                color: Colors.black,
              ),
                Container(
                height: 40,
                width: 50,
                color: Color.fromARGB(255, 109, 45, 45),
              ),  Container(
                height: 40,
                width: 50,
                color: Color.fromARGB(255, 36, 8, 109),
              ),
              ],),
            )
        ],
      ),
    );
  }
}