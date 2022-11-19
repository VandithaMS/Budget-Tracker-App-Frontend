import 'package:budget_tracker/acc.dart';
import 'package:budget_tracker/main.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'donutChart.dart';
import 'constant.dart' as cns;
import 'dart:async';

int inr=0;
int btn=0;
double z=150;
double q=230;
Color clr2=Colors.blue;
Color clr1=Color.fromARGB(255, 41, 58, 71);

List<String> items=[
  "Expense",
  "Food",
  "Shopping",
  "House",
  "Vehicle",
  "Entertainment",
  "Investment",
  "Others",
];
String? selectedItem="Expense";

class Calc extends StatefulWidget {
  //const Calc({Key? key}) : super(key: key);
  @override
  
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  Timer timer=Timer(Duration(seconds: 0),(){});
  @override
  void initState(){
    inr=0;
    btn=0;
    clr1=Colors.blue;
    clr2=Color.fromARGB(255, 41, 58, 71);
    selectedItem="Expense";
    super.initState();
    if(this.mounted){
    timer = new Timer.periodic(new Duration(milliseconds: 1), (Timer timer) async {
      
        setState(() {
                inr=inr;
            });
      });
        }
  }

  @override
    void dispose() {
        super.dispose();
        timer.cancel();
    }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),),
      ),
      backgroundColor: Colors.blue,
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 400),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          clr2=Color.fromARGB(255, 41, 58, 71);
                          clr1=Colors.blue;
                          btn=0;
                        });
                      },
                      child: Container(
                        height: 70,
                        color: clr2,
                        child: Center(child: Text("INCOME",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold))),
                                  ),
                    ),
                  ),
                  Expanded(
      child:Container(
        height: 70,
        decoration: BoxDecoration(
        color: clr1,),
        child: Align(
          alignment: Alignment.center,
          child: DropdownButtonFormField<String>(
            itemHeight: 70,
            decoration: InputDecoration(
                isCollapsed: true,
                enabledBorder: InputBorder.none),
                  dropdownColor: clr2,
                  value: selectedItem,
                  icon: const Icon(Icons.arrow_downward),
                  iconEnabledColor: Color.fromARGB(255, 227, 226, 226),
                  //icon: Visibility (visible:false, child: Icon(Icons.arrow_downward)),
                  iconSize: 30,  
                  items: items.map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:70.0),
                        child: Text(item,style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    )).toList(),
                  onChanged: (item) {
                    setState(() {
                      selectedItem = item;
                      clr1=Color.fromARGB(255, 41, 58, 71);
                      clr2=Colors.blue;
                      btn=1;
                    });
                  },
                ),
        ),
      ),
      ),
                  Btns("ADD")
                ],
              ),
              Container(
                height: 200,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(inr.toString(),style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold,color: Colors.white),)),
                      SizedBox(width: 15,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text("INR",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 200,),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    Center(
                      child:  Padding(
                        padding: const EdgeInsets.only(left:200.0),
                        child: Column(
                            children: [
                              Row(children: [
                                Num(7,z),Num(8,z),Num(9,z)
                              ],),
                              Row(children: [
                                Num(4,z),Num(5,z),Num(6,z)
                              ],),
                              Row(children: [
                                Num(1,z),Num(2,z),Num(3,z)
                              ],),
                            ],
                          ),
                      ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left:200.0),
                      child: Row(
                        children: [
                          Num(0,q),
                          GestureDetector(
                            onTap: (){
              setState(() {
                var i=inr/10;
                inr=i.toInt();
              });
            },
            child: Card(
              child: Container(
                height: 65,
                width: q,
                color: Color.fromARGB(255, 217, 214, 214),
                child: Center(child:Text("del",style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 83, 82, 82)),),),
        ),
      ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),)
    );
  }
}

class Btns extends StatefulWidget {
  //const Btns({Key? key}) : super(key: key);
  Btns(this.title);
  final String title;

  @override
  State<Btns> createState() => _BtnsState();
}

class _BtnsState extends State<Btns> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap:(){
          
          setState(() {
            if (btn==0){
            cns.balance=cns.balance+inr;
          }
          else if (btn==1 && inr<=cns.balance){
              cns.balance=cns.balance-inr;
              cns.exp=cns.exp+inr;
              String addItem=selectedItem.toString();
              getchart(GDPData(addItem,inr.toDouble()));
            }
          });

          if(btn==1 && inr>cns.balance){
            showAlertDialog(context);
          }
          else{
            Navigator.push(
            context,
            MaterialPageRoute(
                  builder: (context) => MyHomePage(title: "Home",)),
                );
          }

          //Navigator.pop(context);
        },
        child: Container(
          height: 70,
          color: Colors.blue,
          child: Center(child: Text(widget.title,style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold))),
                    ),
      ),
    );
  }
}
class Num extends StatefulWidget {
  //const Num({Key? key}) : super(key: key);
  Num(this.nums,this.x);
  final int nums;
  final double x;
  @override
  State<Num> createState() => _NumState();
}

class _NumState extends State<Num> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          inr=inr*10+widget.nums;
        });
      },
      child: Card(
        child: Container(
          height: 65,
          width: widget.x,
          // decoration: BoxDecoration(
          //   border: Border.all(color: Color.fromARGB(255, 71, 70, 70)),
          // ),
          color: Color.fromARGB(255, 217, 214, 214),
          child: Center(child:Text(widget.nums.toString(),style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 83, 82, 82)),),),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {  
 
  Widget okButton = GestureDetector(  
    child: Text("OK"),  
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
            context,
            MaterialPageRoute(
                  builder: (context) => MyHomePage(title: "Home",)),
                );
    },  
  );  
  
  AlertDialog alert = AlertDialog(  
    title: Text("Alert",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),  
    content: Text("Your balance is low.",style: TextStyle(fontSize: 20),),  
    actions: [  
      okButton,  
    ],  
  );  
  
  showDialog(  
    context: context,  
    builder: (BuildContext context) {  
      return alert;  
    },  
  );  
}  
