import 'dart:convert';
import 'package:flutter/services.dart';

class Product {
  Product({
    required this.name,
    required this.manufacturer,
    required this.price,
    required this.size,
    required this.imageUrl,
  });

  String name;
  String manufacturer;
  int price;
  String size;
  String imageUrl;
}

List jsonItems = [];

List<Product> products = [];

//Read json file containing products into jsonItems, add this information as a product to the list of products
Future<List<Product>> readProductFile() async {
  final String response =
      await rootBundle.loadString('lib/assets/products.json');

  final data = await json.decode(response);

  jsonItems = data["products"];

  for (int i = 0; i < jsonItems.length; i++) {
    products.add(Product(
      name: jsonItems[i]["name"],
      manufacturer: jsonItems[i]["manufacturer"],
      price: jsonItems[i]["price"],
      size: jsonItems[i]["size"],
      imageUrl: jsonItems[i]["imageUrl"],
    ));
  }
  return products;
}
