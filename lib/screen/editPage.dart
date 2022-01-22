import 'package:flutter/material.dart';
import 'package:radwanstore/model/product.dart';
import 'package:radwanstore/screen/myCapital.dart';
import 'package:radwanstore/service/sharedPrefrenceserv.dart';

import '../app_Data.dart';
import 'myStore.dart';

class EditPage extends StatefulWidget {
  static String id='EditPage' ;

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _globalkey=new GlobalKey<FormState>();
    List nameAndIsStore=ModalRoute.of(context)!.settings.arguments as List ;
    String name=nameAndIsStore[0];
    bool isStore=nameAndIsStore[1];
    double price=0 ;
    int count=0;
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: () {
        isStore? Navigator.of(context).pushReplacementNamed(MyStore.id):Navigator.of(context).pushReplacementNamed(MyCapital.id);
      },),),
      body: Center(
        child:Form(
          key: _globalkey,
          child: Column(
            children: [
              Text(name),
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
                  if(int.tryParse(value.toString())==null) return 'pleas input intger number';
                },
                onSaved: (newValue) {
                  setState(() {
                    count=int.tryParse(newValue.toString())! ;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'enter name of product',
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
              ElevatedButton(onPressed: () {
                _globalkey.currentState!.validate();
                _globalkey.currentState!.save() ;
                int indexofproduct=0 ;
                if(isStore){
                  for(int i=0;i<product_list.length;i++){
                    if(product_list[i].name==name){
                      indexofproduct=i;
                      break ;
                    }
                  }
                }
                else {
                  for(int i=0;i<product_capital_list.length;i++){
                    if(product_capital_list[i].name==name){
                      indexofproduct=i;
                      break ;
                    }
                  }
                }
                isStore? product_list[indexofproduct]=Product(name: name, price: price, count: count):product_capital_list[indexofproduct]=Product(name: name, price: price, count: count) ;
                saveproductlistprefrence();
                saveproductcapitallistprefrence();
                isStore? Navigator.of(context).pushReplacementNamed(MyStore.id):Navigator.of(context).pushReplacementNamed(MyCapital.id);


              }, child: Text('update product'))
            ],
          ),
        )
      ),

    );
  }
}
