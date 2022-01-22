import 'package:flutter/material.dart';
import 'package:radwanstore/screen/editPage.dart';

rowtableofproduct(BuildContext cx,String name,double price,int count,bool isStore){
  return TableRow(
      children:[
        Center(child: Text(name)),
        Center(child: Text(price.toString())),
        Center(child: Text(count.toString())),

        Center(
          child: IconButton(onPressed: () {
            Navigator.of(cx).pushReplacementNamed(EditPage.id,arguments:[name,isStore]);
          }, icon: Icon(Icons.edit)),
        )
      ]
  );
}
