import 'package:ecommerce_app/consts/my_icons.dart';
import 'package:ecommerce_app/provider/favs_provider.dart';
import 'package:ecommerce_app/screens/wishlist/wishlist_empty.dart';
import 'package:ecommerce_app/services/globle_method.dart';
import 'package:ecommerce_app/screens/wishlist/wishlit_full.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';
  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods =GlobalMethods();
    final favsProvider =Provider.of<FavsProvider>(context);
    return favsProvider.getFavsItems.isEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
      appBar: AppBar(
        title: Text('Wishlist (${favsProvider.getFavsItems.length})'),
        actions: [
          IconButton(
            onPressed: () {
              globalMethods.showDialogg(
                  'Clear wishlist!',
                  'Your wishlist will be cleared!',
                      () => favsProvider
                      .clearFavs(),context);
              // cartProvider.clearCart();
            },
            icon: Icon(MyAppIcons.trash),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: favsProvider.getFavsItems.length,
        itemBuilder: (BuildContext ctx, int index) {
          return ChangeNotifierProvider.value(
              value: favsProvider.getFavsItems.values.toList()[index],
              child: WishlistFull(
                productId: favsProvider.getFavsItems.keys.toList()[index],
              ));
        },
      ),
    );
  }
}
