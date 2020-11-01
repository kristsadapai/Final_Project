import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:Final_Project/cart.dart';
import 'dart:async';

  String food_id = "";
  List<String> food = [
    "ข้าวไข่เจียว",
    "ข้าวผัด",
    "ส้มตำ",
    "หมาล่า",
    "สาหร่ายพวงองุ่น",
    "ไข่ปูดอง",
  ];

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
   String _now;
Timer _everySecond;

@override
  void initState() {
    super.initState();
        readfood1();
        readfood2();
        readfood3();
        readfood4();
        readfood5();
        readfood6();
        readcart1();
        readcart2();
        readcart3();
        readcart4();
        readcart5();
        readcart6();

    // sets first value
    _now = DateTime.now().second.toString();
    // defines a timer 
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _now = DateTime.now().second.toString();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[
        ],
        backgroundColor: Colors.orangeAccent[100],
          title: Row(   
              children: [
                  Container(
                  margin: const EdgeInsets.only(left: 120.0, right: 20.0),
                  child: Text('Menu')
                  ),

            ],

          ),
  ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/img/bg.jpg"), fit: BoxFit.cover),
        ),
        child: Center(
                child: Column(children: <Widget>[
                SizedBox(height: 10),
                Text("เมนู",style: TextStyle(color: Colors.black,fontSize: 30)),
                 SizedBox(height: 10),
                DropDownField(
                onValueChanged: (dynamic value) {
                  food_id = value;
                },
                value: food_id,
                required: false,
                hintText: 'เลือกเมนูอาหาร',
                labelText: 'เมนูอาหาร',
                items: food,
              ),
               Container(
               
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 300,
                  child:   RawMaterialButton(
              padding: EdgeInsets.fromLTRB(10,  0, 10, 00),
              onPressed: ()=>{
                addfood()
              },
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
              fillColor: Colors.redAccent[100],
              child:
               Text('เพิ่มลงตะกร้า', style: TextStyle(color: Colors.white,fontSize: 10),),)),
              Image.asset(
                 'lib/img/'+food_id.toString()+'.jpg',
                  fit: BoxFit.cover,
                  height: 200,
                  width: 250,
              ),Text(food_id.toString(), style: TextStyle(color: Colors.black,fontSize: 30)),
                Text("ราคา     "+prices.toString()+"  บาท", style: TextStyle(color: Colors.black,fontSize: 30)) 
            ],),
          ),
        ),floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
           Navigator.push(context,
              MaterialPageRoute(builder: (context) => Cart()),  );
        },
        label: Text('ตะกร้า'),
        icon: Icon(Icons.shopping_basket),
        backgroundColor: Colors.redAccent[200],
      ),
    );
  }
}
void cartopen(){
  databaseReference.child("ตะกร้า").child("อาหาร").child("ข้าวไข่เจียว").set(0);
  databaseReference.child("ตะกร้า").child("อาหาร").child("ข้าวผัด").set(0);
  databaseReference.child("ตะกร้า").child("อาหาร").child("ส้มตำ").set(0);
  databaseReference.child("ตะกร้า").child("อาหาร").child("หมาล่า").set(0);
  databaseReference.child("ตะกร้า").child("อาหาร").child("สาหร่ายพวงองุ่น").set(0);
  databaseReference.child("ตะกร้า").child("อาหาร").child("ไข่ปูดอง").set(0);
}
void addfood(){
  var cart1xi = int.tryParse(cart1x);
  var cart2xi = int.tryParse(cart2x);
  var cart3xi = int.tryParse(cart3x);
  var cart4xi = int.tryParse(cart4x);
  var cart5xi = int.tryParse(cart5x);
  var cart6xi = int.tryParse(cart6x);

  if (food_id == "ข้าวไข่เจียว"){
    databaseReference.child("ตะกร้า").child("อาหาร").child("ข้าวไข่เจียว").set(cart1xi+1);
  }
   else if(food_id == "ข้าวผัด"){
     databaseReference.child("ตะกร้า").child("อาหาร").child("ข้าวผัด").set(cart2xi+1);

      }
   else if(food_id == "ส้มตำ"){
     databaseReference.child("ตะกร้า").child("อาหาร").child("ส้มตำ").set(cart3xi+1);

  }
   else if(food_id == "หมาล่า"){
     databaseReference.child("ตะกร้า").child("อาหาร").child("หมาล่า").set(cart4xi+1);

  }
   else if(food_id == "สาหร่ายพวงองุ่น"){
     databaseReference.child("ตะกร้า").child("อาหาร").child("สาหร่ายพวงองุ่น").set(cart5xi+1);

  }
   else if(food_id == "ไข่ปูดอง"){
    databaseReference.child("ตะกร้า").child("อาหาร").child("ไข่ปูดอง").set(cart6xi+1);

  }
  else{
    
  }

}

void foodprice(){
  if (food_id == "ข้าวไข่เจียว"){
    prices = food1x ;

  }
   else if(food_id == "ข้าวผัด"){
    prices = food2x;

  }
   else if(food_id == "ส้มตำ"){
    prices = food3x;

  }
   else if(food_id == "หมาล่า"){
    prices = food4x ;

  }
   else if(food_id == "สาหร่ายพวงองุ่น"){
    prices = food5x;
 
  }
   else if(food_id == "ไข่ปูดอง"){
    prices = food6x;
 
  }
  else{
    prices = "";

  }
}
void readfood1(){
    food1.once().then((DataSnapshot dataSnapshot){
      var food1s = dataSnapshot.value.toString();
      food1x = food1s;
    });
}
void readfood2(){
    food2.once().then((DataSnapshot dataSnapshot){
      var food2s = dataSnapshot.value.toString();
      food2x = food2s;
    });
}
void readfood3(){
    food3.once().then((DataSnapshot dataSnapshot){
      var food3s = dataSnapshot.value.toString();
      food3x = food3s;
    });
}
void readfood4(){
    food4.once().then((DataSnapshot dataSnapshot){
      var food4s = dataSnapshot.value.toString();
      food4x = food4s;
    });
}
void readfood5(){
    food5.once().then((DataSnapshot dataSnapshot){
      var food5s = dataSnapshot.value.toString();
      food5x = food5s;
    });
}
void readfood6(){
    food6.once().then((DataSnapshot dataSnapshot){
      var food6s = dataSnapshot.value.toString();
      food6x = food6s;
    });
}
void readcart1(){
    cart1.once().then((DataSnapshot dataSnapshot){
      var cart1s = dataSnapshot.value.toString();
      cart1x = cart1s;
    });
}
void readcart2(){
    cart2.once().then((DataSnapshot dataSnapshot){
      var cart2s = dataSnapshot.value.toString();
      cart2x = cart2s;
    });
}
void readcart3(){
    cart3.once().then((DataSnapshot dataSnapshot){
      var cart3s = dataSnapshot.value.toString();
      cart3x = cart3s;
    });
}
void readcart4(){
    cart4.once().then((DataSnapshot dataSnapshot){
      var cart4s = dataSnapshot.value.toString();
      cart4x = cart4s;
    });
}
void readcart5(){
    cart5.once().then((DataSnapshot dataSnapshot){
      var cart5s = dataSnapshot.value.toString();
      cart5x = cart5s;
    });
}
void readcart6(){
    cart6.once().then((DataSnapshot dataSnapshot){
      var cart6s = dataSnapshot.value.toString();
      cart6x = cart6s;
    });
}
var food1x;
var food2x;
var food3x;
var food4x;
var food5x;
var food6x;
var cart1x;
var cart2x;
var cart3x;
var cart4x;
var cart5x;
var cart6x;
var prices;
int counts;
int count = 0;
final databaseReference = FirebaseDatabase.instance.reference();
final food1 = FirebaseDatabase.instance.reference().child('อาหาร').child('ข้าวไข่เจียว').child('ราคา');
final food2 = FirebaseDatabase.instance.reference().child('อาหาร').child('ข้าวผัด').child('ราคา');
final food3 = FirebaseDatabase.instance.reference().child('อาหาร').child('ส้มตำ').child('ราคา');
final food4 = FirebaseDatabase.instance.reference().child('อาหาร').child('หมาล่า').child('ราคา');
final food5 = FirebaseDatabase.instance.reference().child('อาหาร').child('สาหร่ายพวงองุ่น').child('ราคา');
final food6 = FirebaseDatabase.instance.reference().child('อาหาร').child('ไข่ปูดอง').child('ราคา');
final cart1 = databaseReference.child("ตะกร้า").child("อาหาร").child("ข้าวไข่เจียว");
final cart2 = databaseReference.child("ตะกร้า").child("อาหาร").child("ข้าวผัด");
final cart3 = databaseReference.child("ตะกร้า").child("อาหาร").child("ส้มตำ");
final cart4 = databaseReference.child("ตะกร้า").child("อาหาร").child("หมาล่า");
final cart5 = databaseReference.child("ตะกร้า").child("อาหาร").child("สาหร่ายพวงองุ่น");
final cart6 = databaseReference.child("ตะกร้า").child("อาหาร").child("ไข่ปูดอง");

