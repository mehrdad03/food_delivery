import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedPopularProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedPopularProductRepo({required this.apiClient});

  Future<Response> getRecommendedPopularProductList() async {
    return await apiClient.getData(AppConstants.RECOMANDED_PRODUCT_URI);
  }
}
