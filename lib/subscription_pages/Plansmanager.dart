import 'package:flutter/material.dart';

class Plans {
  String plan_type;
  String price;
  String period;
  Plans({@required this.plan_type,@required this.price,@required this.period});
}

final planslist = [
  Plans(plan_type: 'MONTHLY', price: '€50',period: '\/monthly'),
  Plans(plan_type: 'Yearly', price: '€300',period: '\/annually'),
  Plans(plan_type: 'Life-time', price: '€500',period: '\/one-time')
];