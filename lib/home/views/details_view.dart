import 'dart:ui';
import 'package:eightythree/core/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class DetailsView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          Positioned(
              child: Image.network(
                controller.home.image,
                height: Get.height,
                width: Get.width,
                fit: BoxFit.fill,
              )),
          Positioned(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 30,
                width: 30,
                margin: EdgeInsets.only(top: 40, right: 20),
                decoration: BoxDecoration(
                    color: MyColors.iconBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Colors.grey,
                  size: 15,
                ),
              ),
            ),
            left: 20,
            top: 0,
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Get.width / 3),
                        topRight: Radius.circular(Get.width / 3),
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      child: Container(
                          color: MyColors.transparentColor.withAlpha(100),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 10,
                              sigmaY: 10,
                            ),
                            child: Container(
                              // width: Get.width / 5,
                              // height: Get.width / 12,
                              margin: EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Transform.rotate(
                                    angle: -30,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/images/cursor.png',
                                      color: Color(0xffbfc2c6),
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    '3D TOUR'.toUpperCase(),
                                    style: TextStyle(
                                        fontFamily: "MonumentValley12",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        letterSpacing: 1,
                                        color: Color(0xffbfc2c6)),
                                  ),
                                ],
                              ),
                            ),
                          ))),
                ),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      color: MyColors.backgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Text(
                    controller.home.address,
                    style: TextStyle(
                        color: MyColors.fontColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Detail Oriented House",
                    style: TextStyle(
                        color: MyColors.fontColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        Image.asset(
                          "assets/images/bed.png",
                          height: 25,
                          width: 25,
                        ),
                        Text(
                          controller.home.bed,
                          style: TextStyle(
                              color: MyColors.iconColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      SizedBox(
                        width: 10,
                      ),
                      // Spacer(flex: 1,),
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        Image.asset(
                          "assets/images/path.png",
                          height: 25,
                          width: 25,
                        ),
                        Text(
                          controller.home.path,
                          style: TextStyle(
                              color: MyColors.iconColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      SizedBox(
                        width: 10,
                      ),

                      // Spacer(flex: 1,),
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        Icon(
                          Icons.fullscreen,
                          color: MyColors.iconColor,
                        ),
                        Text(
                          controller.home.space,
                          style: TextStyle(
                              color: MyColors.iconColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text('m2', style: TextStyle(
                              color: MyColors.iconColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),),
                        )
                      ]),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    // height: 130,
                      decoration: BoxDecoration(
                          color: Color(0xfff4f6fb),
                          borderRadius:
                          BorderRadius.all(Radius.circular(30))),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  child: Image.network(
                                    controller.home.image,
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          controller.home.user,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Text(
                                        controller.home.userType
                                            .toUpperCase(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            letterSpacing: 1,
                                            color: MyColors
                                                .rightAppBarBackground),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.snackbar(
                                        "Calling", controller.home.phone);
                                  },
                                  child: Transform(
                                    alignment: FractionalOffset.center,
                                    transform: new Matrix4.identity()
                                      ..rotateY(180 * 3.1415927 / 180),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color:
                                          Colors.grey[400].withAlpha(50),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Icon(
                                        Icons.phone_rounded,
                                        color: MyColors.rightAppBarBackground,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            controller.home.userDescription,
                            maxLines: 3,
                            style: TextStyle(
                                color: MyColors.iconColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text(
                    "\$" + controller.home.price,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                        flex: 3,
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                                color: MyColors.rightAppBarBackground,
                                borderRadius:
                            BorderRadius.all(Radius.circular(15))),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Get.snackbar(
                              "Calling", controller.home.phone);
                        },
                        child: Text(
                          "BOOK A HOUSE",
                          style: TextStyle(
                              letterSpacing: 2,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
        )),
    ],
    ),
    )
    ]));
    }

  Widget bottomSheet;
}
