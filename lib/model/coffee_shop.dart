import 'package:coffee_shop/model/coffee.dart';
import 'package:flutter/widgets.dart';

class CoffeeShop with ChangeNotifier {
  // coffee selling list
  final List<Coffee> _shop = [
    Coffee(name: 'Cappuccino', price: '₹100', imagePath: 'assets/coffee.png'),
    Coffee(name: 'Latte', price: '₹250', imagePath: 'assets/coffee1.png'),
    Coffee(name: 'Mocha', price: '₹200', imagePath: 'assets/coffee2.png'),
    Coffee(name: 'Americano', price: '₹150', imagePath: 'assets/coffee3.png'),
    Coffee(name: 'Espresso', price: '₹300', imagePath: 'assets/coffee4.png'),
    Coffee(name: 'Cold Brew', price: '₹400', imagePath: 'assets/coffee5.png'),
    Coffee(name: 'Iced Coffee', price: '₹450', imagePath: 'assets/coffee6.png'),
    Coffee(name: 'Breve', price: '₹500', imagePath: 'assets/coffee7.png'),
  ];

  final List<Coffee> _userCart = []; // user cart

  List<Coffee> get coffeeShop => _shop; // get coffee list

  List<Coffee> get userCart => _userCart; // get user cart

// add item
  void addItem(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

// remove item
  void removeItem(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }

// clear cart
  void clearCart() {
    _userCart.clear();
    notifyListeners();
  }
}
