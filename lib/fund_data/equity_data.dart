import 'package:flutter/material.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

class Equity {
  String name;
  String price;
  String id;
  String value;
  String imageUrl;

  Equity(
      {required this.name,
      required this.price,
      required this.id,
      required this.value,
      required this.imageUrl});
}

List<Equity> equitiesList = [
  Equity(
      name: "Fundsmith Equity T Acc",
      price: "569.55 (+4.50) (+0.80%)",
      id: '0P0000RU7W.L',
      value: "26 billion GBP",
      imageUrl: 'assets/fundsmith.png'),
  Equity(
      name: "Fundsmith Emerging Equities Trust Plc",
      price: "1,230.30 (-14.70) (-1.18%)",
      id: '0P0000RU7W.L',
      value: "26 billion GBP",
      imageUrl: 'assets/fundsmith.png'),
  Equity(
      name: "Fundsmith Equity T Acc",
      price: "562.79 (+4.45) (+0.80%)",
      id: '0P0000RU7W.L',
      value: "26 billion GBP",
      imageUrl: 'assets/fundsmith.png')
];
