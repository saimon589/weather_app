import 'package:flutter/material.dart';
import 'package:weather_app/utils/text_style.dart';

class ItemsCard extends StatelessWidget {
  const ItemsCard({Key? key,this.label,
    this.condition, this.units}) : super(key: key);
  final label;
  final condition;
  final units;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple.withOpacity(0.7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Text(label,style: allText,),
        title: Text(condition,style: allText,),
        trailing: Text(units,style: allText,),
      )
    );
  }
}
