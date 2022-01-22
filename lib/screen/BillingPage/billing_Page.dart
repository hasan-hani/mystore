import 'package:flutter/material.dart';
import 'package:radwanstore/app_Data.dart';
import 'package:radwanstore/service/searchBilling.dart';
import 'package:radwanstore/service/sharedPrefrenceserv.dart';
import 'package:radwanstore/widget/billig_Drawer.dart';
import 'package:radwanstore/widget/buyingItem.dart';
import 'package:radwanstore/widget/selling_Item.dart';

class Billing_Page extends StatefulWidget {
  static String id='Billing_Page' ;

  @override
  State<Billing_Page> createState() => _Billing_PageState();
}

class _Billing_PageState extends State<Billing_Page> {
  @override
  Widget build(BuildContext context) {
    List<TableRow> buyingrowlist=[TableRow(children: [Center(child: Text('Date')),Center(child: Text('Name')),Center(child: Text('count'))])];
    buying_list.forEach((buying) { buyingrowlist.add(rowtableofbuying(buying.name,buying.countofbuying,buying.Dayofbuyning));});
    List<TableRow> sellingrowlist=[TableRow(children: [Center(child: Text('Date')),Center(child: Text('Name')),Center(child: Text('count'))])];
    selling_list.forEach((selling) { sellingrowlist.add(rowtableofselling(selling.name,selling.countofbuying,selling.Dayofbuyning));});
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text('are you sure you want to delete '),
                  actions: [
                    ElevatedButton(onPressed: () {
                      setState(() {
                        buying_list=[];
                        selling_list=[];
                      });
                      saveproductlistbuyingprefrence();
                      saveproductlistsellingprefrence();
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
          IconButton(onPressed: ()  {
            setState(() {

            });
             showSearch(context: context, delegate: SearchBilling());
          }, icon:Icon(Icons.search))
        ],
      ),
      drawer: Drawer(
        child: BillingDrawer(),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2
        ),
        children: [
          Container(
            color: Colors.greenAccent,
            child: Table(
              children: buyingrowlist,
            ),
          ),
          Container(
            color: Colors.yellow,
            child: Table(
              children: sellingrowlist,
            ),
          )
        ],
      )
    );
  }
}
