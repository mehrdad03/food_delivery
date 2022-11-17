import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/expandable_text.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /*background image*/
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImageSize,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/food0.png"))),
              )),
          /*icon widgets*/
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )),
          /*introduction of food*/
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImageSize - 20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius30),
                        topLeft: Radius.circular(Dimensions.radius30)),
                    color: Colors.white),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppColumn(
                        text: 'Chinese Side',
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      BigText(text: "Introduce"),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      const Expanded(
                          child: SingleChildScrollView(
                        child: ExpandableText(
                            text:
                                "Lorem ipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametem ipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametem ipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametem ipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametem ipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametem ipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametem ipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametipsum dolor sit ametipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet erat diam. Maecenas ultrices porta lorem et volutpat. Suspendisse nec diam in lorem placerat cursus. Duis scelerisque, urna in dignissim consectetur, risus nunc sagittis nulla, vel convallis nunc urna sed"),
                      ))
                    ],
                  ),
                ),
              )),
        ],
      ),
      bottomNavigationBar: Container(
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
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  BigText(text: '   0   '),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            /*price & add to cart*/
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20),
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius20)),
              child: BigText(
                text: "\$0.08 Add to cart",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
