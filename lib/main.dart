import 'package:flutter/material.dart';
import 'package:products_app/models/product.dart';
import 'package:products_app/widgets/productTile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: const TextTheme(
            headline1: TextStyle(color: Colors.black, fontSize: 20)),
      ),
      home: const MyHomePage(title: 'Products'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //read json product file and create grid from items
      body: FutureBuilder<List<Product>>(
          future: readProductFile(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (BuildContext context, int index) {
                    //if there is data return a productTile, else return error text or a loading circle
                    return productTile(product: products[index]);
                  });
            } else if (snapshot.hasError) {
              return const Text('Error with database');
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
