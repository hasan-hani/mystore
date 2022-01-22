import 'package:flutter/material.dart';
rowtableofselling(String name,int count,DateTime dayOfSelling){
  return TableRow(
      children:[
        Center(child: Text('${dayOfSelling.year}/${dayOfSelling.month}/${dayOfSelling.day}')),
        Center(child: Text(name)),
        Center(child: Text(count.toString())),

      ]
  );
}