import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:brightstarshop/models/product.dart';
import 'package:brightstarshop/models/product_rep.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}


class _HomescreenState extends State<Homescreen> {

  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package:product.assetPackage,

              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[

                    Text(
                      product.name,
                      style: theme.textTheme.titleLarge,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              semanticLabel: 'menu',
            ),
            onPressed: () {
              print('Menu Button');
            },
          ),
          title: Text('Bright Star'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  print('Search button');
                },
                icon: const Icon(
                  Icons.search,
                  semanticLabel: 'Search',
                )),
            IconButton(
                onPressed: () {
                  print('Filter button');
                },
                icon: const Icon(
                  Icons.tune,
                  semanticLabel: 'Filter',
                )),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16),
          childAspectRatio: 8 / 9,
          children:_buildGridCards(context)
              ),
            );
  }
}
