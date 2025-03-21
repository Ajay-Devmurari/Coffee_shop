import 'package:coffee_shop/model/coffee_shop.dart';
import 'package:coffee_shop/widget/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/coffee.dart';
import '../widget/toast_msg.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItem(coffee);
  }

  @override
  Widget build(BuildContext context) {
    final wt = MediaQuery.of(context).size.width;
    return Consumer<CoffeeShop>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Do you like coffee?',
                  style: TextStyle(
                      fontSize: wt * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.coffeeShop.length,
                    itemBuilder: (context, index) {
                      Coffee item = value.coffeeShop[index];
                      return CustomListTile(
                        coffee: item,
                        onTap: () {
                          addToCart(item);
                          CustomSnackBar.show(
                              context, "${item.name} added to cart!");
                        },
                        icon: const Icon(Icons.add),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
