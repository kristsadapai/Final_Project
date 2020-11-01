import 'package:Final_Project/menu.dart';
import 'package:Final_Project/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

 final database = FirebaseDatabase.instance.reference();
class Login extends StatefulWidget {
 
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
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
              Image.asset("lib/img/go.png",height: 250,),
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
                    controller: emailcontroller,
                    decoration: new InputDecoration(
                    hintText: 'Username or Email',
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
                    controller: passwordcontroller,
                    obscureText: true,
                    decoration: new InputDecoration(
                    hintText: 'Password',
                   )
                    
                  ),
                 ),
                 SizedBox(height: 5,),
        Container(
                margin: const EdgeInsets.only(left: 150.0, right: 20.0),
                padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  height: 50.0,
                  width: 250,
                  child:  RawMaterialButton(
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
              onPressed: ()=>{
                 Navigator.push(context,
              MaterialPageRoute(builder: (context) => Regis()),  )
              },
              fillColor: Colors.redAccent,
              child: Text('สมัครสมาชิค', style: TextStyle(color: Colors.white),),)
                  ,),
            SizedBox(height: 20,),
             Container(
               
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 300,
                  child:   RawMaterialButton(
                    padding: EdgeInsets.fromLTRB(20,  20, 20, 20),
              onPressed: ()=>{
                checklogin()
                
              },
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
              fillColor: Colors.green,
              child:
               Text('เข้าสู่ระบบ', style: TextStyle(color: Colors.white,fontSize: 20),),)),  
            ],),
          ),
        ),
      ),
    );
  }
  void checklogin(){
var data = database.child("User").child(emailcontroller.text);
    data.child(emailcontroller.text).once().then((DataSnapshot snapshot){
      print('Data ======>${snapshot.value}');
      if('${snapshot.value}' == 'null'){
       showDialog(context: context, child:
    new AlertDialog(
      title: new Text("ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง"),
      content: new Text("กรุณากรอกใหม่"),
    )
);
        print('user');

      }
      else if(passwordcontroller.text == '${snapshot.value['password']}'){
  
        Navigator.push(context,
              MaterialPageRoute(builder: (context) => Menu()),  );
        }else{
        print('รหัสไม่ถูก');
        }
      
      
    });
}
}
