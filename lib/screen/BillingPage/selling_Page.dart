import 'package:flutter/material.dart';
import 'package:radwanstore/app_Data.dart';
import 'package:radwanstore/model/buying.dart';
import 'package:radwanstore/model/product.dart';
import 'package:radwanstore/model/selling.dart';
import 'package:radwanstore/service/sharedPrefrenceserv.dart';

class SellingPage extends StatefulWidget {
  static String id='SellingPage' ;
  @override
  _SellingPageState createState() => _SellingPageState();
}

class _SellingPageState extends State<SellingPage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _globalkey=GlobalKey<FormState>() ;
    String name ='' ;
    int count=0 ;
    return Scaffold(
      appBar: AppBar(),
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
                if(findTheIndexOfItemInListOfProduct(name)!=-1){selling_list.add(Selling(
                    Dayofbuyning: DateTime.now(),
                    name: name,
                    countofbuying: count));}
                findTheIndexOfItemInListOfProduct(name)==-1?
                showDialog(context: context, builder:(context) {
                  return AlertDialog(
                    title: Text('you dont have this item to sell it'),
                  );
                },):
                product_list[findTheIndexOfItemInListOfProduct(name)]=Product(
                    name: name, price: product_list[findTheIndexOfItemInListOfProduct(name)].price, count: product_list[findTheIndexOfItemInListOfProduct(name)].count-count);
                saveproductlistprefrence();
                saveproductlistsellingprefrence() ;
              }, child: Text('selling'))
            ],
          ),
        ),
      ),
    );
  }
}
