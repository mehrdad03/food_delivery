import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductsList = [];

  List<dynamic> get popularProductsList => _popularProductsList;

  late CartController _cart;

  /*showing loading icon*/
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  /*showing loading icon*/

  /*Add to cart*/
  int _quantity = 0;

  int get quantity => _quantity;

  /*Add to cart*/

  /*To save value when changing page*/
  int _inCartItems = 0;

  int get inCartItems => _inCartItems + _quantity;

  /*To save value when changing page*/

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      _popularProductsList = [];
      _popularProductsList.addAll(Product.fromJson(response.body).products);
//      print(_popularProductsList);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      print("number items $_quantity");
    } else {
      _quantity = checkQuantity(_quantity - 1);
      print("number items $_quantity");
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((quantity + _inCartItems) < 0) {
      Get.snackbar("Item Count", "You can't reduce more !",
          backgroundColor: Colors.white);
      return 0;
    } else if ((quantity + _inCartItems) > 20) {
      Get.snackbar("Item Count", "You can't add more !",
          backgroundColor: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    //print("exsit or not "+exist.toString());
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
      print("quantity is the cart " + _inCartItems.toString());
    }
    //get from storage _inCartItems
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print("id is ${value.id}quantity is ${value.quantity}");
    });

    update();//for update parameter in ui
  }

  int get totalItems {
    return _cart.totalItems;
  }
}
