import 'package:flutter/material.dart';
import 'package:radwanstore/screen/editPage.dart';

rowtableofbuying(String name,int count,DateTime dayOfBuying){
  return TableRow(
      children:[
        Center(child: Text('${dayOfBuying.year}/${dayOfBuying.month}/${dayOfBuying.day}')),
        Center(child: Text(name)),
        Center(child: Text(count.toString())),

      ]
  );
}
