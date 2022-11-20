import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductsList = [];

  List<dynamic> get popularProductsList => _popularProductsList;

  /*showing loading icon*/
  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;
  /*showing loading icon*/

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {

      _popularProductsList = [];
      _popularProductsList.addAll(Product.fromJson(response.body).products);
//      print(_popularProductsList);
      _isLoaded=true;
      update();
    } else {}
  }
}
