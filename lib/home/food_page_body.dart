import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: .85);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }
}

Widget _buildPageItem(int index) {
  return Stack(
    children: [
      Container(
          height: 220,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven ? AppColors.mainColor : Colors.black54,
            image: const DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/image/food0.png")),
          )),
      Align(
        //like position widget
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 120,
          margin: const EdgeInsets.only(
            left: 30,
            bottom: 20,
            right: 30,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: "Chinese Side"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Wrap(
                      //put children horizontally
                      children: List.generate(
                          5,
                          (index) => Icon(
                                Icons.star,
                                color: AppColors.mainColor,
                                size: 15,
                              )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SmallText(text: "4.5"),
                    const SizedBox(
                      width: 10,
                    ),
                    SmallText(text: "1287  comments"),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconAndTextWidget(
                        text: 'Normal',
                        icon: Icons.circle_sharp,
                        iconColor: AppColors.iconColor1),
                    IconAndTextWidget(
                        text: '1.7',
                        icon: Icons.location_on,
                        iconColor: AppColors.mainColor),
                    IconAndTextWidget(
                        text: 'Normal',
                        icon: Icons.access_time_rounded,
                        iconColor: AppColors.iconColor2),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
