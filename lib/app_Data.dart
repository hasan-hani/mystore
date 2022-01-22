import 'package:radwanstore/model/buying.dart';

import 'model/product.dart';
import 'model/selling.dart';

List<Product> product_list=[
  Product(name: '1.5', price: 117, count: 4),
  Product(name: '2.5', price: 178, count: 1),
  Product(name: '2', price: 150, count: 5),
  Product(name: '0.5', price: 50, count: 2),

];
List<Product> product_capital_list=[
  Product(name: '1.5', price: 117, count: 4),
  Product(name: '2.5', price: 178, count: 1),
  Product(name: '2', price: 150, count: 5),
  Product(name: '0.5', price: 50, count: 2),
];
List<Buying> buying_list=[] ;
List<Selling> selling_list=[];
int findTheIndexOfItemInListOfProduct(String name){
  for(int i=0;i<product_list.length;i++){
    if(name==product_list[i].name)
      {
        return i ;
      }
  }
  return -1 ;
}
