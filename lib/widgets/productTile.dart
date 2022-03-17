import 'package:flutter/material.dart';
import 'package:products_app/models/product.dart';

//GridTile to show items in the grid
class productTile extends StatelessWidget {
  productTile({Key? key, required this.product}) : super(key: key);

  Product product;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      header: GridTileBar(
          title:
              Text(product.name, style: Theme.of(context).textTheme.headline1)),
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.scaleDown,
        ),
      ),
      footer: GridTileBar(
        subtitle: Text(
          product.size,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
