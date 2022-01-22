import 'package:flutter/material.dart';
import 'package:radwanstore/app_Data.dart';
import 'package:radwanstore/widget/billig_Drawer.dart';
import 'package:radwanstore/widget/buyingItem.dart';
import 'package:radwanstore/widget/selling_Item.dart';

class BuyingViewPage extends StatelessWidget {
  static String id='BuyingViewPage' ;

  @override
  Widget build(BuildContext context) {
    List<TableRow> buyingrowlist=[TableRow(children: [Center(child: Text('Date')),Center(child: Text('Name')),Center(child: Text('count'))])];
    buying_list.forEach((buying) { buyingrowlist.add(rowtableofbuying(buying.name,buying.countofbuying,buying.Dayofbuyning));});

    return Scaffold(
        appBar: AppBar(
        ),
        drawer: Drawer(
          child: BillingDrawer(),
        ),
        body: Container(
          color: Colors.greenAccent,
          child: Table(
            children: buyingrowlist,
          ),
        )
    );
  }
}
