import 'package:flutter/cupertino.dart';
import 'package:pharmacy/database/database_service.dart';
import 'package:pharmacy/model/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  final dbService = DatabaseService.instance;

  int _counter = 0;
  int get counter => _counter;

  int _quantity = 1;
  int get quantity => _quantity;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  List<Cart> cart = [];

  Future<List<Cart>> getData() async {
    cart = await dbService.getItemList();
    notifyListeners();
    return cart;
  }

  void _setPreferenceItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setInt('item_quantity', _quantity);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPreferenceItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_items') ?? 0;
    _quantity = prefs.getInt('item_quantity') ?? 1;
    _totalPrice = prefs.getDouble('total_price') ?? 0.0;
  }

  void addCounter() {
    _counter++;
    _setPreferenceItems();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    _setPreferenceItems();
    notifyListeners();
  }

  int getCounter() {
    _getPreferenceItems();
    return _counter;
  }

  void addQuantity(int id) {
    final index = cart.indexWhere((element) => element.id == id);
    cart[index].quantity!.value = cart[index].quantity!.value + 1;
    _setPreferenceItems();
    notifyListeners();
  }

  void deleteQuantity(int id) {
    final index = cart.indexWhere((element) => element.id == id);
    final currentQuantity =
        cart[index].quantity!.value = cart[index].quantity!.value + 1;
    if (currentQuantity <= 1) {
      currentQuantity == 1;
    } else {
      cart[index].quantity!.value = cart[index].quantity!.value + 1;
    }
    _setPreferenceItems();
    notifyListeners();
  }

  void removeItem(int id) {
    final index = cart.indexWhere((element) => element.id == id);
    cart.removeAt(index);
    _setPreferenceItems();
    notifyListeners();
  }

  int getQuantity(int qty) {
    _getPreferenceItems();
    return qty;
  }

  void addTotalPrice(double productPrice, void addCounter) {
    _totalPrice = _totalPrice + productPrice;
    _setPreferenceItems();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    _setPreferenceItems();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPreferenceItems();
    return _totalPrice;
  }
}
