import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;


  //x=phone screen size / height of slider for ex:880/220
  static double pageView = screenHeight / 2.64;

  //x=phone screen size / height of slider for ex:880/220
  static double pageViewContainer = screenHeight / 3.84;

  //x=phone screen size / height of slider for ex:880/120
  static double pageViewTextContainer = screenHeight / 7.02;

//for padding responsive
  static double height10 = screenHeight / 90.4;
  static double height15 = screenHeight / 85.27;
  static double height20 = screenHeight / 50.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;

  //for padding  and margin responsive
  static double width10 = screenHeight / 90.4;
  static double width15 = screenHeight / 85.27;
  static double width20 = screenHeight / 50.2;
  static double width30 = screenHeight / 28.13;
  //font size
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  //icon size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight /52.75;

  /*list view size*/
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContainerSize = screenWidth / 3.9;

  /*popular food*/
  static double popularFoodImageSize = screenHeight / 2.41;

  /*bottom height*/
  static double bottomHeight = screenHeight / 9;
}
