import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_popular_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;

  const RecommendedFoodDetail({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedPopularProductController>()
        .recommendedPopularProductsList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.clear)),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return Stack(
                    children: [
                      AppIcon(icon: Icons.shopping_cart_outlined),
                      Get.find<PopularProductController>().totalItems >= 1
                          ? Positioned(
                          top: 0,
                          right: 0,
                          child: AppIcon(
                            icon: Icons.circle,
                            size: 20,
                            iconColor: Colors.transparent,
                            backgroundColor: AppColors.mainColor,
                          ))
                          : Container(),
                      Get.find<PopularProductController>().totalItems >= 1
                          ? Positioned(
                          top: 3,
                          right: 6,
                          child: BigText(
                            text: Get.find<PopularProductController>()
                                .totalItems
                                .toString(),
                            size: 12,
                            color: Colors.white,
                          ))
                          : Container()
                    ],
                  );
                }),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20))),
                width: double.maxFinite,
                child: Center(
                    child: BigText(
                  text: product.name,
                  size: Dimensions.font26,
                )),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: ExpandableText(
                    text: product.description,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20 * 5.5,
                  vertical: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                GestureDetector(
                onTap:(){
                controller.setQuantity(false);
                },
                child: AppIcon(
                iconSize: Dimensions.iconSize24,
                icon: Icons.remove,
                iconColor: Colors.white,
                backgroundColor: AppColors.mainColor),
                ),
                  BigText(
                    text: "\$ ${product.price!} | X ${controller.inCartItems}",
                    color: AppColors.mainBlackColor,
                    size: Dimensions.font26,
                  ),
                  GestureDetector(
                    onTap:(){
                      controller.setQuantity(true);
                    },
                    child: AppIcon(
                        iconSize: Dimensions.iconSize24,
                        icon: Icons.add,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20, vertical: Dimensions.height20),
              height: Dimensions.bottomHeight,
              decoration: BoxDecoration(
                  color: AppColors.buttonBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20 * 2),
                      topRight: Radius.circular(Dimensions.radius20 * 2))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /*number*/
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width20,
                        vertical: Dimensions.height20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
                  ),
                  /*price & add to cart*/
                  GestureDetector(
                    onTap: (){
                      controller.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width20,
                          vertical: Dimensions.height20),
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(Dimensions.radius20)),
                      child: BigText(
                        text: "\$ ${product.price} | Add to cart",
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },),
    );
  }
}
