import 'package:flutter/material.dart';
import 'package:radwanstore/app_Data.dart';
import 'package:radwanstore/screen/addIteme.dart';
import 'package:radwanstore/service/sharedPrefrenceserv.dart';
import 'package:radwanstore/widget/productItem.dart';

class MyStore extends StatefulWidget {
  static String id='MyStore' ;
  @override
  _MyStoreState createState() => _MyStoreState();
}

class _MyStoreState extends State<MyStore> {
  @override
  Widget build(BuildContext context) {
    List<TableRow> productrowlist=[TableRow(children: [Center(child: Text('Name')),Center(child: Text('Price')),Center(child: Center(child: Text('count'))),Center(child: Text('Edit'))])];
    product_list.forEach((product) { productrowlist.add(rowtableofproduct(context,product.name,product.price,product.count,true));});
    bool isStore=true ;
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
                       product_list=[];
                     });
                     saveproductlistprefrence() ;
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
             for(int i=0;i<product_list.length;i++)
               {
                 totalPrice =product_list[i].price*product_list[i].count+totalPrice;
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
          Navigator.of(context).pushReplacementNamed(AddItem.id,arguments:isStore);
        },
        child: Text('add'),

      ),
      );

  }
}
