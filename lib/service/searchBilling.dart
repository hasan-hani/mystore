import 'package:flutter/material.dart';
import 'package:radwanstore/widget/buyingItem.dart';
import 'package:radwanstore/widget/selling_Item.dart';

import '../app_Data.dart';

class SearchBilling extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed:() {query='';}, icon:Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context,null) ;

    }, icon: Icon(Icons.arrow_back)) ;
  }

  @override
  Widget buildResults(BuildContext context) {
    List<TableRow> buyingrowlist=[TableRow(children: [Center(child: Text('Date')),Center(child: Text('Name')),Center(child: Text('count'))])];
    buying_list.forEach((buying) { if(buying.name.contains(query)) buyingrowlist.add(rowtableofbuying(buying.name,buying.countofbuying,buying.Dayofbuyning));});
    List<TableRow> sellingrowlist=[TableRow(children: [Center(child: Text('Date')),Center(child: Text('Name')),Center(child: Text('count'))])];
    selling_list.forEach((selling) {if(selling.name.contains(query)) sellingrowlist.add(rowtableofselling(selling.name,selling.countofbuying,selling.Dayofbuyning));});
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
      ),
      children: [
        Container(
          color: Colors.greenAccent,
          child: Table(
            children: buyingrowlist,
          ),
        ),
        Container(
          color: Colors.yellow,
          child: Table(
            children: sellingrowlist,
          ),
        )
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<TableRow> buyingrowlist=[TableRow(children: [Center(child: Text('Date')),Center(child: Text('Name')),Center(child: Text('count'))])];
    buying_list.forEach((buying) { if(buying.name.contains(query)) buyingrowlist.add(rowtableofbuying(buying.name,buying.countofbuying,buying.Dayofbuyning));});
    List<TableRow> sellingrowlist=[TableRow(children: [Center(child: Text('Date')),Center(child: Text('Name')),Center(child: Text('count'))])];
    selling_list.forEach((selling) {if(selling.name.contains(query)) sellingrowlist.add(rowtableofselling(selling.name,selling.countofbuying,selling.Dayofbuyning));});
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
      ),
      children: [
        Container(
          color: Colors.greenAccent,
          child: Table(
            children: buyingrowlist,
          ),
        ),
        Container(
          color: Colors.yellow,
          child: Table(
            children: sellingrowlist,
          ),
        )
      ],
    );
  }

}