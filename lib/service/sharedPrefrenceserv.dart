import 'package:radwanstore/model/buying.dart';
import 'package:radwanstore/model/product.dart';
import 'package:radwanstore/model/selling.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_Data.dart';
saveproductlistprefrence()async{
  SharedPreferences preference=await SharedPreferences.getInstance() ;
  List<String> listofstringproduct=[] ;
  product_list.forEach((product) {
    listofstringproduct.add(product.name);
    listofstringproduct.add(product.price.toString());
    listofstringproduct.add(product.count.toString());
  });
  preference.setStringList('listofproduct', listofstringproduct) ;
}
getproductlistprefrence()async{
  SharedPreferences preference=await SharedPreferences.getInstance() ;
  List<String> listofstringproduct=[];
   listofstringproduct=preference.getStringList('listofproduct')!;
  product_list=[];
  for(int i=0;i<listofstringproduct.length;i=i+3){
    product_list.add(
        Product(
            name: listofstringproduct[i],
            price: double.parse(listofstringproduct[i+1]),
            count: int.parse(listofstringproduct[i+2])
          // price: 45,
          // count: 2
        )

    );
  }
}
saveproductcapitallistprefrence()async{
  SharedPreferences preference=await SharedPreferences.getInstance() ;
  List<String> listofstringproduct=[] ;
  product_capital_list.forEach((product) {
    listofstringproduct.add(product.name);
    listofstringproduct.add(product.price.toString());
    listofstringproduct.add(product.count.toString());
  });
  preference.setStringList('listofcapitalproduct', listofstringproduct) ;
}
getproductlistcapitalprefrence()async{
  SharedPreferences preference=await SharedPreferences.getInstance() ;
  List<String> listofstringproduct=[];
  listofstringproduct=preference.getStringList('listofcapitalproduct')!;
  product_capital_list=[];
  for(int i=0;i<listofstringproduct.length;i=i+3){
    product_capital_list.add(
        Product(
            name: listofstringproduct[i],
            price: double.parse(listofstringproduct[i+1]),
            count: int.parse(listofstringproduct[i+2])
          // price: 45,
          // count: 2
        )

    );
  }
}
saveproductlistbuyingprefrence()async{
  SharedPreferences preference=await SharedPreferences.getInstance() ;
  List<String> listofstringbuying=[] ;
  buying_list.forEach((Buying) {
    listofstringbuying.add(Buying.Dayofbuyning.toString());
    listofstringbuying.add(Buying.name);
    listofstringbuying.add(Buying.countofbuying.toString());
  });
  preference.setStringList('listofbuying', listofstringbuying) ;
}
getproductlistbuyingprefrence()async{
  SharedPreferences preference=await SharedPreferences.getInstance() ;
  List<String> listofstringbuying=[];
  listofstringbuying=preference.getStringList('listofbuying')!;
  buying_list=[];
  for(int i=0;i<listofstringbuying.length;i=i+3){
    buying_list.add(
        Buying(
            Dayofbuyning:DateTime.parse(listofstringbuying[i]),
            name: listofstringbuying[i+1],
            countofbuying: int.parse(listofstringbuying[i+2]),

    ));
  }
}
saveproductlistsellingprefrence()async{
  SharedPreferences preference=await SharedPreferences.getInstance() ;
  List<String> listofstringselling=[] ;
  selling_list.forEach((Selling) {
    listofstringselling.add(Selling.Dayofbuyning.toString());
    listofstringselling.add(Selling.name);
    listofstringselling.add(Selling.countofbuying.toString());
  });
  preference.setStringList('listofselling', listofstringselling) ;
}
getproductlistsellingprefrence()async{
  SharedPreferences preference=await SharedPreferences.getInstance() ;
  List<String> listofstringelling=[];
  listofstringelling=preference.getStringList('listofselling')!;
  selling_list=[];
  for(int i=0;i<listofstringelling.length;i=i+3){
    selling_list.add(
        Selling(
          Dayofbuyning:DateTime.parse(listofstringelling[i]),
          name: listofstringelling[i+1],
          countofbuying: int.parse(listofstringelling[i+2]),
        ));
  }
}