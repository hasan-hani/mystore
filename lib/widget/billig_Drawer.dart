import 'package:flutter/material.dart';
import 'package:radwanstore/screen/BillingPage/buyingViewPage.dart';
import 'package:radwanstore/screen/BillingPage/selling_View_Page.dart';
class BillingDrawer extends StatelessWidget {
  buildList(String title,Function fun){
    return ListTile(
      title: Text(title),
      onTap: (){fun();},
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildList('buying', (){Navigator.of(context).pushNamed(BuyingViewPage.id);}),
        buildList('Selling', (){Navigator.of(context).pushNamed(Selling_View_Page.id);}),
      ],
    );
  }
}
