import 'package:flutter/material.dart';
import 'package:radwanstore/screen/BillingPage/billing_Page.dart';
import 'package:radwanstore/screen/BillingPage/buyingViewPage.dart';
import 'package:radwanstore/screen/BillingPage/selling_Page.dart';
import 'package:radwanstore/screen/BillingPage/selling_View_Page.dart';
import 'package:radwanstore/screen/addIteme.dart';
import 'package:radwanstore/screen/BillingPage/buyingPage.dart';
import 'package:radwanstore/screen/editPage.dart';
import 'package:radwanstore/screen/mainpage.dart';
import 'package:radwanstore/screen/myCapital.dart';
import 'package:radwanstore/screen/myStore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RdwanStore',
      home: MainPage(),
      routes:{
        AddItem.id:(context)=>AddItem(),
        MyStore.id:(context)=>MyStore(),
        EditPage.id:(context)=>EditPage(),
        MainPage.id:(context)=>MainPage(),
        MyCapital.id:(context)=>MyCapital(),
        BuyingPage.id:(context)=>BuyingPage(),
        Billing_Page.id:(context)=>Billing_Page(),
        SellingPage.id:(context)=>SellingPage(),
        BuyingViewPage.id:(context)=>BuyingViewPage(),
        Selling_View_Page.id:(context)=>Selling_View_Page(),
      }
    );
  }
}


