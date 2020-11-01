import 'package:flutter/material.dart';
import 'package:Final_Project/Loginpage.dart';
import 'package:firebase_database/firebase_database.dart';


class Regis extends StatefulWidget {
  @override
  _RegisState createState() => _RegisState();
}

class _RegisState extends State<Regis> {
  final reemailcontroller = TextEditingController();
  final repasswordcontroller = TextEditingController();
  final reconpasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/img/bg.jpg"), fit: BoxFit.cover),
        ),
        child: Center(
          child: SingleChildScrollView(
                      child: Column(children: <Widget>[
              SizedBox(height: 30,),
              Image.asset("lib/img/go.png",height: 150,),
              Text("สมัครสมาชิค", style: TextStyle(color: Colors.black,fontSize: 20),),
              SizedBox(height: 20,),
               Container(
                 padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  height: 50.0,
                  width: 250,
                  decoration: new BoxDecoration(
                    color: Colors.yellow[300],
                    border: new Border.all(
                      color: Colors.white,
                      width: 4.0
                    ),
                    borderRadius: new BorderRadius.circular(12.0)
                  ),
                  child: TextFormField(
                    controller: reemailcontroller,
                    decoration: new InputDecoration(
                    hintText: 'Username',
                   )
                    
                  ),
                 ),
                 SizedBox(height: 30,),
                Container(
                 padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  height: 50.0,
                  width: 250,
                  decoration: new BoxDecoration(
                    color: Colors.yellow[300],
                    border: new Border.all(
                      color: Colors.white,
                      width: 4.0
                    ),
                    borderRadius: new BorderRadius.circular(12.0)
                  ),
                  child: TextFormField(
                    controller: repasswordcontroller,
                    obscureText: true,
                    decoration: new InputDecoration(
                    hintText: 'Password',
                   )
                    
                  ),
                 ),
                 SizedBox(height: 30,),
                Container(
                 padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  height: 50.0,
                  width: 250,
                  decoration: new BoxDecoration(
                    color: Colors.yellow[300],
                    border: new Border.all(
                      color: Colors.white,
                      width: 4.0
                    ),
                    borderRadius: new BorderRadius.circular(12.0)
                  ),
                  child: TextFormField(
                    controller: reconpasswordcontroller,
                    obscureText: true,
                    decoration: new InputDecoration(
                    hintText: 'Confirm Password',
                   )
                    
                  ),
                 ),
            SizedBox(height: 20,),
             Container(
               
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 300,
                  child:   RawMaterialButton(
                    padding: EdgeInsets.fromLTRB(20,  20, 20, 20),
              onPressed: ()=>{
                regis()
              },
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
              fillColor: Colors.redAccent,
              child:
               Text('สมัครสมาชิก', style: TextStyle(color: Colors.white,fontSize: 20),),)),  
            ],),
          ),
        ),
      ),
    );
  }
  void regis(){
    var data = database.child("User").child(reemailcontroller.text);
    
    if (repasswordcontroller.text != reconpasswordcontroller.text){
        showDialog(context: context, child:
    new AlertDialog(
      title: new Text("รหัสผ่านไม่ตรงกัน"),
      content: new Text("กรุณากรอกใหม่"),
    )
);
    }
    else{
      data.set(reemailcontroller.text);
      data.child(reemailcontroller.text).child("password").set(repasswordcontroller.text);
      Navigator.push(context,
              MaterialPageRoute(builder: (context) => Login()),  );
    }
  }
}
