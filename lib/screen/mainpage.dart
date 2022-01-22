import 'package:flutter/material.dart';
import 'package:radwanstore/model/buying.dart';
import 'package:radwanstore/screen/myCapital.dart';
import 'package:radwanstore/service/sharedPrefrenceserv.dart';

import 'BillingPage/billing_Page.dart';
import 'BillingPage/buyingPage.dart';
import 'BillingPage/selling_Page.dart';
import 'myStore.dart';

class MainPage extends StatelessWidget {
  static String id='MainPage' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              getproductlistprefrence();
              Navigator.of(context).pushNamed(MyStore.id);

            }, child: Text('My Store')),
            ElevatedButton(onPressed: () {
              getproductlistcapitalprefrence();
              Navigator.of(context).pushNamed(MyCapital.id);
            }, child: Text('My Capitel')),
            ElevatedButton(onPressed: () {
              getproductlistbuyingprefrence() ;
              Navigator.of(context).pushNamed(BuyingPage.id) ;

            }, child:Text('buying')),
            ElevatedButton(onPressed: () {
              getproductlistsellingprefrence() ;
              Navigator.of(context).pushNamed(SellingPage.id) ;

            }, child:Text('selling')),
            ElevatedButton(onPressed: () {
              getproductlistbuyingprefrence() ;
              getproductlistsellingprefrence() ;
              Navigator.of(context).pushNamed(Billing_Page.id) ;

            }, child:Text('billing'))

          ],
        ),
      ),
    );
  }
}
