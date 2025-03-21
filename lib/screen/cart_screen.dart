import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/coffee.dart';
import '../model/coffee_shop.dart';
import '../widget/button.dart';
import '../widget/list_tile.dart';
import '../widget/toast_msg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void removeItem(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItem(coffee);
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
                  'Your Cart',
                  style: TextStyle(
                      fontSize: wt * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: value.userCart.length,
                        itemBuilder: (context, index) {
                          Coffee item = value.userCart[index];
                          return CustomListTile(
                              coffee: item,
                              onTap: () {
                                removeItem(item);
                                CustomSnackBar.show(
                                    context, "${item.name} remove to cart!");
                              },
                              icon: const Icon(Icons.delete));
                        })),
                PaymentButton(
                  onTap: () {
                    if (value.userCart.isEmpty) {
                      CustomSnackBar.show(context, "Your cart is empty!");
                    } else {
                      CustomSnackBar.show(context, "Payment Successful!");
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
