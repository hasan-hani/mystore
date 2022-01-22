import 'package:flutter/material.dart';
import 'package:radwanstore/app_Data.dart';
import 'package:radwanstore/widget/billig_Drawer.dart';
import 'package:radwanstore/widget/buyingItem.dart';
import 'package:radwanstore/widget/selling_Item.dart';

class Selling_View_Page extends StatelessWidget {
  static String id='Selling_View_Page' ;

  @override
  Widget build(BuildContext context) {

    List<TableRow> sellingrowlist=[TableRow(children: [Center(child: Text('Date')),Center(child: Text('Name')),Center(child: Text('count'))])];
    selling_list.forEach((selling) { sellingrowlist.add(rowtableofselling(selling.name,selling.countofbuying,selling.Dayofbuyning));});
    return Scaffold(
        appBar: AppBar(
        ),
        drawer: Drawer(
          child: BillingDrawer(),
        ),
        body: Container(
          color: Colors.yellow,
          child: Table(
            children: sellingrowlist,
          ),
        )
    );
  }
}
