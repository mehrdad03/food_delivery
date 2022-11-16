import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [ Container(
          child: Container(
            padding: EdgeInsets.only(left: 20,right: 20),
            margin: EdgeInsets.only(top: 45,bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  children: [
                    Text("Country"),
                    Text("City"),
                  ],
                ),
                Center(
                  child: Container(
                    child: Icon(Icons.search,color: Colors.white,),

                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor),
                  ),
                ),

              ],
            ),
          ),
        )],
      ),
    );
  }
}
