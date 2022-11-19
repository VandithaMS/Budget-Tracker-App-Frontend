import 'package:budget_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'constant.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pswd = TextEditingController();

  // final _auth = FirebaseAuth.instance;

  bool tap(String email){

    final bool val = EmailValidator.validate(email);
    return val;
  }

  bool passwrd(psw){
    final int len = psw.length;
    if (len>5){
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Signin",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      backgroundColor: Color.fromARGB(255, 227, 226, 226),
      body: Center(
        child: Container(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(
              width: 700,
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: "Username"
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            SizedBox(
              width: 700,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: "Email"
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            SizedBox(
              width: 700,
              child: TextField(
                controller: pswd,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: "Password"
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
              SizedBox(
                height: 50,
                width: 120,
                child: ElevatedButton(
                  onPressed: () async {
                    final bool = tap(email.text.toString());
                    if (bool==true && name.text!=null && passwrd(pswd.text)==true){
                    //   try{
                    //  final newUser = await _auth.createUserWithEmailAndPassword(email: email.text, password: pswd.text);
                    //  if (newUser!=null){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage(title: 'Home'),)
                      );
                    }//}
                    // catch(e){
                    //   print(e);
                    // }}
                    else{
                      showAlertDialog(context);
                    
                    }
                  },
                  child: Text("Signin",style: TextStyle(color: Colors.white,backgroundColor: Colors.blue,fontSize: 20),)),
              )
          ]),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {  
 
  Widget okButton = GestureDetector(  
    child: Text("OK",style: TextStyle(fontSize: 20),),  
    onTap: () {
      Navigator.pop(context);
    },  
  );  
  
  AlertDialog alert = AlertDialog(  
    title: Text("Alert",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),  
    content: Text("Enter data properly.Password length must be greater than 4.",style: TextStyle(fontSize: 20),),  
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
