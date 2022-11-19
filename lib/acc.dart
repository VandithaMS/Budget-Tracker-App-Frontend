import 'package:budget_tracker/calc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'donutChart.dart';

class Acc extends StatelessWidget {
  //const Acc({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 226, 226),
      body: ListView(
        children: [Container(
          //width: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                              child:Padding(
                                padding: const EdgeInsets.fromLTRB(40,20,15,15),
                                child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text("Balance Amount",style: TextStyle(fontSize: 30,color: Colors.black),)),
                                        SizedBox(height: 15,),
                                        Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text("Rs. "+balance.toString(),style: TextStyle(fontSize: 25,color: Colors.black),)),
                                            SizedBox(width: 30,),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: GestureDetector(
                                                child: Container(
                                                color: Colors.blue,
                                                height: 30,
                                                width: 40,
                                                child: Center(child: Text("Edit")),
                                                                              ),
                                                  onTap: (){ Navigator.push(context, 
                                          MaterialPageRoute(builder: (context) => Calc(),));},                
                                              ),
                                            )
                                          ],
                                        ),
                                        ],
                                    ),
                                ),
                              ),
                  ),
                          SizedBox(height: 30,),
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40,20,15,15),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text("Expenses structure",style: TextStyle(fontSize: 30,color: Colors.black),)
                              ),
                            SizedBox(height: 30,),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text("Rs. "+exp.toString(),style: TextStyle(fontSize: 25,color: Colors.red),)
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 300,
                                  width: 200,
                                  child: Chart()),
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    color: Colors.white,
                  ),
                  SizedBox(height: 30,),
                  Container(
                    color: Colors.white,
                  ),
                  SizedBox(height: 30,),
                  Container(
                    color: Colors.white,
                  )
              ]),
            ),
          ),
          
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, 
                   MaterialPageRoute(builder: (context) => Calc(),));
          },
          tooltip: 'new',
          child: const Icon(Icons.add),
        ),
    );
      
  }
}