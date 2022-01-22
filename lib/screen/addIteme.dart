import 'package:flutter/material.dart';
import 'package:radwanstore/app_Data.dart';
import 'package:radwanstore/model/product.dart';
import 'package:radwanstore/screen/mainpage.dart';
import 'package:radwanstore/screen/myCapital.dart';
import 'package:radwanstore/screen/myStore.dart';
import 'package:radwanstore/service/sharedPrefrenceserv.dart';


class AddItem extends StatefulWidget {
  static String id='AddItem' ;
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    bool isStore =ModalRoute.of(context)!.settings.arguments as bool ;
    GlobalKey<FormState> _globalkey=new GlobalKey<FormState>() ;
    String name='' ;
    double price=0;
    int count=0 ;
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: () {
        Navigator.of(context).pushReplacementNamed(MyStore.id);
      },),),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key:_globalkey ,
                  child: Column(
                children: [
                  TextFormField(
                    onSaved: (newValue) {
                      name=newValue.toString();
                    },
                    validator: (value) {
                      if(value==''){return 'please input the name of product';}
                    },
                    decoration: InputDecoration(
                      hintText: 'enter name of product',
                      filled: true,prefixIcon: Icon(Icons.person),
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.white10
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.white10
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.white10
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if(double.tryParse(value.toString())==null) return 'pleas input double number' ;
                    },
                    onSaved: (newValue) {
                      price=double.tryParse(newValue.toString())!;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'enter the price of product',
                      filled: true,prefixIcon: Icon(Icons.money),
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.white10
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.white10
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.white10
                        ),
                      ),
                    ),

                  ),
                  TextFormField(
                    validator: (value) {
                      if(int.tryParse(value.toString())==null) return 'pleas input number of product';
                    },
                    onSaved: (newValue) {
                     setState(() {
                       count=int.tryParse(newValue.toString())! ;
                     });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'enter number of product',
                      filled: true,prefixIcon: Icon(Icons.add),
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.white10
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.white10
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.white10
                        ),
                      ),
                    ),

                  ),

                ],
              )
              ),

              ElevatedButton(onPressed: () {
                _globalkey.currentState!.validate();
                _globalkey.currentState!.save() ;
                isStore? product_list.add(Product(name: name, price: price, count: count)):product_capital_list.add(Product(name: name, price: price, count: count)) ;
                saveproductlistprefrence();
                saveproductcapitallistprefrence();
                isStore? Navigator.of(context).pushReplacementNamed(MainPage.id):Navigator.of(context).pushReplacementNamed(MyCapital.id);

              }, child: Text('Enter New product'))
            ],
          ),
        ),
      ),
    );
  }
}
