import 'dart:ui';
import 'package:budget_tracker/main.dart';
import 'budg.dart';
import 'main.dart' as main;
import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  //const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {

TextEditingController title = new TextEditingController();
TextEditingController amt = new TextEditingController();
TextEditingController save = new TextEditingController();
TextEditingController note = new TextEditingController();
String s1='';
String s2='';
String s3='';
String s4='';

String? selectedItem="Food";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),),
      ),
      backgroundColor: Color.fromARGB(255, 227, 226, 226),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter Details: ",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.blue),),
              SizedBox(
              height: 50,
              ),
             SizedBox(
               width: 900,
               child: TextField(
                 autofocus: true,
                 controller: title,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: "Enter Title"
                ),
               ),
             ),
             SizedBox(
               height: 30,
             ),
             SizedBox(
               width: 900,
               child: TextField(
                 controller: amt,
               decoration: InputDecoration(
                 filled: true,
                  fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: "Enter Amount"
               ),
             ),),
             SizedBox(
               height: 30,
             ),
             SizedBox(
               width: 900,
               child: TextField(
                 controller: save,
               decoration: InputDecoration(
                 filled: true,
                  fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: "Enter Savings"
               ),
             ),),
             SizedBox(
               height: 30,
             ),
             SizedBox(
               width: 900,
               child: TextField(
               maxLines: 5,
                 controller: note,
               decoration: InputDecoration(
                 filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: "Note",
               ),
             )),
             SizedBox(
               height: 35,
             ),
             SizedBox(
               width: 900,
               child: Align(
                 alignment: Alignment.topRight,
                 child: GestureDetector(
                   onTap: (){
                     setState(() {
                       s1=title.text.toString();
                       s2=amt.text.toString();
                       s3=save.text.toString();
                       s4=note.text.toString();
                       main.bd=Budget();
                     });
                     
                     gls.add(GLSdata(s1,s2,s3,s4));
                     Navigator.push(context,
                     MaterialPageRoute(builder: (context)=> MyHomePage(title: 'Home'))
                     );
                   },
                   child: Card(
                     child: Container(
                       width: 100,
                       color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(child: Text("Set",style: TextStyle(fontSize: 30,color: Colors.white),)),
                      )
                     ),
                   ),
                 ),
               ),
             )
            ],
          ),
      )
      )
    );
  }
}


