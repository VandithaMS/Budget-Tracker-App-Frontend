// import 'package:flutter/cupertino.dart';
import 'acc.dart';
import 'budg.dart';
import 'signin.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
Widget bd=Acc();
FontWeight fw1=FontWeight.w100;
FontWeight fw2=FontWeight.w300;
double l=0;
double r=950;

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Tracker',
      theme: ThemeData(
        //theme: ThemeData.dark(),
        primarySwatch: Colors.blue,
      ),
      home: const Signin(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text(widget.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
                bottom:PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child:   Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                              fw2=FontWeight.w300;
                              fw1=FontWeight.w100;
                              l=0;
                              r=950;
                              bd=Acc();
                                });
                            },
                            child: Container(
                              height: 35,
                              child: Column(
                                children: [
                                  Center(child: Text('Accounts', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: fw2),)),
                                SizedBox(height: 10,)],
                              )
                              ),
                          ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  fw1=FontWeight.w300;
                                  fw2=FontWeight.w100;
                                  l=950;
                                  r=0;
                                  bd=Budget();
                                });
                            },
                              child: Container(
                              height: 35,
                              child: Column(
                                children: [
                                  Center(child: Text('Goals', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: fw1),)),
                                SizedBox(height: 10,)],
                              )
                              ),
                            ),
                        ],
                      ),
                      Container(
                            height: 5,
                            color: Colors.white,
                            //width: MediaQuery.of(context).size.width * 0.50,
                            margin: EdgeInsets.fromLTRB(l,0,r,0),
                             alignment: Alignment.topRight,
                          ),
                  ],
                ),
                )),
                drawer: const NavDrawer(),
                backgroundColor: Color.fromARGB(255, 227, 226, 226),
                body:bd,//Container(color:Colors.black,),
                //child: Column(children: [Text("hi")]),),
          
      );
}
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    width: 600,
    child: Drawer(
       child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 600,
              child: DrawerHeader(
                child: Text(
                  'Side menu',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/img.jpg'))),
              ),
            ),
           SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Account',style: TextStyle(fontSize: 25),),
              onTap: () => {
                // Navigator.push(context, 
                // MaterialPageRoute(builder: (context) =>MyApp(),))
              },
            ),
            // SizedBox(height: 20,),
            // ListTile(
            //   leading: Icon(Icons.settings),
            //   title: Text('Settings',style: TextStyle(fontSize: 25),),
            //   onTap: () => {},
            // ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout',style: TextStyle(fontSize: 25),),
              onTap: () => {},
            ),
          ],
        ),
    ),
  );
}
