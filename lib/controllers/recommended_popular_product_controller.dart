import 'package:food_delivery/data/repository/recommended_popular_product_repo.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedPopularProductController extends GetxController {
  final RecommendedPopularProductRepo recommendedPopularProductRepo;

  RecommendedPopularProductController({required this.recommendedPopularProductRepo});

  List<dynamic> _recommendedPopularProductsList = [];

  List<dynamic> get  recommendedPopularProductsList => _recommendedPopularProductsList;

  /*showing loading icon*/
  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;
  /*showing loading icon*/

  Future<void> getRecommendedPopularProductList() async {
    Response response = await recommendedPopularProductRepo.getRecommendedPopularProductList();

    if (response.statusCode == 200) {

      _recommendedPopularProductsList = [];
      _recommendedPopularProductsList.addAll(Product.fromJson(response.body).products);
//      print(_recommendedPopularProductsList);
      _isLoaded=true;
      update();
    } else {}
  }
}
