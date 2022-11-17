import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        const SizedBox(
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
            SizedBox(
              height: Dimensions.height10,
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
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
    );
  }
}
