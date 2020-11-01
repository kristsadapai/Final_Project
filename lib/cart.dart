import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:Final_Project/menu.dart';
import 'dart:async';

int total1s;
int total2s;
int total3s;
int total4s;
int total5s;
int total6s;

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
   String _now;
Timer _everySecond;

@override
  void initState() {
    super.initState();
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/img/bg.jpg"), fit: BoxFit.cover),
        ),
        child: Center(
                      child: Column(children: <Widget>[
              SizedBox(height: 30,),
              Image.asset("lib/img/go.png",height: 100,),
              Text("ตะกร้า",style: TextStyle(color: Colors.black,fontSize: 30)),
               Container(
                 padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  height: 300.0,
                  width: 400,
                  decoration: new BoxDecoration(
                    color: Colors.yellow[300],
                    border: new Border.all(
                      color: Colors.white,
                      width: 4.0
                    ),
                    borderRadius: new BorderRadius.circular(12.0)

                  ),
                  child:Column(
                    children: [
                    SizedBox(height: 15,),
                      Text("ข้าวไข่เจียว   จำนวน   "+cart1x.toString()+"   ราคา   "+(total1s).toString()+"  บาท"),SizedBox(height: 25,),
                      Text("ข้าวผัด   จำนวน   "+cart2x.toString()+"   ราคา   "+(total2s).toString()+"  บาท"),SizedBox(height: 25,),
                      Text("ส้มตำ   จำนวน   "+cart3x.toString()+"   ราคา   "+(total3s).toString()+"  บาท"),SizedBox(height: 25,),
                      Text("หมาล่า   จำนวน   "+cart4x.toString()+"   ราคา   "+(total4s).toString()+"  บาท"),SizedBox(height: 25,),
                      Text("สาหร่ายพวงองุ่น   จำนวน   "+cart5x.toString()+"   ราคา   "+(total5s).toString()+"  บาท"),SizedBox(height: 25,),
                      Text("ไข่ปูดอง   จำนวน   "+cart6x.toString()+"   ราคา   "+(total6s).toString()+"  บาท"),
                    ],
                    )
                  
                 ),
         Container(
                margin: const EdgeInsets.only(left: 250.0, right: 20.0),
                padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  height: 50,
                  width: 200,
                  child:  RawMaterialButton(
                    padding: EdgeInsets.fromLTRB(10,  10, 10, 10),
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
              onPressed: ()=>{
                cartopen()
              },
              fillColor: Colors.redAccent,
              child: Text('เคลียตะกร้า', style: TextStyle(color: Colors.white,fontSize: 10),),)
                  ,),
              
              SizedBox(height: 10,),
        Container(
                margin: const EdgeInsets.only(left: 50.0, right: 20.0),
                padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  height: 80.0,
                  width: 300,
                  child:  RawMaterialButton(
                    padding: EdgeInsets.fromLTRB(20,  20, 20, 20),
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
              onPressed: ()=>{},
              fillColor: Colors.green,
              child: Text('ชำระเงิน', style: TextStyle(color: Colors.white),),)
                  ,),
         
            ],),
          ),
      ),
    floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
           Navigator.push(context,
              MaterialPageRoute(builder: (context) => Menu()),  );
        },
        label: Text('เมนู'),
        icon: Icon(Icons.shopping_basket),
        backgroundColor: Colors.greenAccent[200],
      ),);
  }
}
void checkcart(){
int totalprice1 = int.tryParse(food1x);
int totalprice2 = int.tryParse(food2x);
int totalprice3 = int.tryParse(food3x);
int totalprice4 = int.tryParse(food4x);
int totalprice5 = int.tryParse(food5x);
int totalprice6 = int.tryParse(food6x);
int totalprices1 = int.tryParse(cart1x);
int totalprices2 = int.tryParse(cart2x);
int totalprices3 = int.tryParse(cart3x);
int totalprices4 = int.tryParse(cart4x);
int totalprices5 = int.tryParse(cart5x);
int totalprices6 = int.tryParse(cart6x);
int total1 = totalprice1*totalprices1;
int total2 = totalprice2*totalprices2;
int total3 = totalprice3*totalprices3;
int total4 = totalprice4*totalprices4;
int total5 = totalprice5*totalprices5;
int total6 = totalprice6*totalprices6;
total1s = total1;
total2s = total2;
total3s = total3;
total4s = total4;
total5s = total5;
total6s = total6;

}