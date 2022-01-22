import 'package:flutter/material.dart';
import 'package:radwanstore/app_Data.dart';
import 'package:radwanstore/service/sharedPrefrenceserv.dart';
import 'package:radwanstore/widget/productItem.dart';

import 'addIteme.dart';

class MyCapital extends StatefulWidget {
  static String id='MyCapital' ;

  @override
  _MyCapitalState createState() => _MyCapitalState();
}

class _MyCapitalState extends State<MyCapital> {
  @override
  Widget build(BuildContext context) {
    List<TableRow> productrowlist=[TableRow(children: [Center(child: Text('Name')),Center(child: Text('Price')),Center(child: Center(child: Text('count'))),Center(child: Text('Edit'))])];
    product_capital_list.forEach((product) { productrowlist.add(rowtableofproduct(context,product.name,product.price,product.count,false));});
    bool isStore=false ;
    return Scaffold(
      appBar:AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text('are you sure you want to delete '),
                  actions: [
                    ElevatedButton(onPressed: () {
                      setState(() {
                        product_capital_list=[];
                      });
                      saveproductcapitallistprefrence() ;
                      Navigator.of(context).pop() ;
                    }, child: Text('ok')),
                    ElevatedButton(onPressed: () {
                      Navigator.of(context).pop() ;
                    }, child: Text('cancel')),
                  ],
                );
              },);
            },
            icon: Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {
              double totalPrice=0;
              for(int i=0;i<product_capital_list.length;i++)
              {
                totalPrice =product_capital_list[i].price*product_capital_list[i].count+totalPrice;
              }
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text('the total price is:$totalPrice'),
                );
              },);
            },
            icon: Icon(Icons.calculate),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Table(
            border: TableBorder.all(),
            children:productrowlist
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(AddItem.id,arguments: isStore);
        },
        child: Text('add'),

      ),
    );
  }
}
