import 'package:food_delivery/pages/food/popular_food_dertail.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/'; //home page
  static const String popularFood = '/popular-food'; //home page
  static const String recommendedFood = '/recommended-food'; //home page
  static String getInitial() => initial;
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) => '$recommendedFood?pageId=$pageId';
  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId=Get.parameters['pageId'];
          return  PopularFoodDetail(pageId:int.parse(pageId!),);
        },
        transition:Transition.fadeIn
        ),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId=Get.parameters['pageId'];
          return  RecommendedFoodDetail(pageId:int.parse(pageId!));
        },
        transition:Transition.fadeIn
        ),

  ]; //home page
}
