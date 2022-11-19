import 'package:budget_tracker/acc.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'create.dart';

List<GLSdata> gls=[];
class Budget extends StatefulWidget {
  const Budget({Key? key}) : super(key: key);

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: ListView(
        children:[ Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
           children:[
             Container(
               width: 1200,
               height: 80,
               decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  ),
               child: Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Text("Goals",style: TextStyle(fontSize: 30),),
               )),
               SizedBox(height: 30,),
               Column(
                 //crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [for (var i in gls)(
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                     width: 1200,
                     height: 200,
                     child: Padding(
                       padding: const EdgeInsets.all(15.0),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Align(
                             alignment: Alignment.topLeft,
                             child: Text(i.goal,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.lightBlue),)),
                           Align(
                             alignment: Alignment.topLeft,
                             child: Text("Amount: "+i.amt,style: TextStyle(fontSize: 20,color: Colors.green),)),
                           Align(
                             alignment: Alignment.topLeft,
                             child: Text("Savings: "+i.save,style: TextStyle(fontSize: 20),)),
                           Align(
                             alignment: Alignment.topLeft,
                             child: Text("Note: "+i.note,style: TextStyle(fontSize: 20),)),
                         ],
                       
                                          )),
                 )))
                 ],
               ),
               SizedBox(height: 30,),
               Container(
                 width: 1200,
                 child: Align(
                   alignment: Alignment.topRight,
                   child: GestureDetector(
                     onTap: (){
                       Navigator.push(context, 
                       MaterialPageRoute(builder: (context) =>Create(),));
                     },
                     child: Container(
                       color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Create",style: TextStyle(fontSize: 30,color: Colors.white),),
                      )
                     ),
                   ),
                 ),
               )
             ] 
        ),]
      ),
    );
  }
}

class GLSdata{
  GLSdata(this.goal,this.amt,this.save,this.note);
  final String  goal;
  final String amt;
  final String  save;
  final String  note;
}