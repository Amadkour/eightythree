import 'package:eightythree/core/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eightythree/routes/app_pages.dart';
import '../controllers/home_controller.dart';
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(200), // here the desired height
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                    width: Get.width,
                    height: 230,
                    color: MyColors.backgroundColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          margin: EdgeInsets.only(top: 40, left: 10),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: MyColors.iconBackgroundColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10))),
                          child: Image.asset("assets/images/menu.png"),
                        ),
                        Container(
                          height: 30,
                          margin: EdgeInsets.only(bottom: 20, left: 10),
                          child: Row(
                            children: [
                              Text("Houses",
                                  style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                              Text(
                                " in New York",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              Positioned(
                child: Transform(
                  alignment: FractionalOffset.bottomLeft,
                  transform: new Matrix4.identity()
                    ..rotateZ(-10 * 3.1415927 / 180),
                  child: Container(
                    height: 200,
                    width: 100,
                    decoration: BoxDecoration(
                        color: MyColors.shadowAppbarColor,
                        borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50))),
                  ),
                ),
                right: 0,
              ),
              Positioned(
                child: Container(
                  height: 200,
                  width: 100,
                  decoration: BoxDecoration(
                      color: MyColors.rightAppBarBackground,
                      borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        margin: EdgeInsets.only(top: 40, right: 20),
                        padding: EdgeInsets.fromLTRB(8, 5, 5, 5),
                        decoration: BoxDecoration(
                            color: MyColors.iconBackground,
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        child: Image.asset("assets/images/menu2.png"),
                      ),
                    ],
                  ),
                ),
                right: 0,
              ),
              Positioned(
                child: Container(
                    height: 50,
                    width: Get.width,
                    margin: EdgeInsets.only(top: 100, left: 30),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Center(
                      child: Container(
                          height: 50,
                          padding: EdgeInsets.only(left: 20, right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              color: Color(0xffeff0f5),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          child: TextField(
                            controller: controller.homeController.value,

                            decoration: InputDecoration(
                              hintText: "name",
                              icon: Image.asset(
                                "assets/images/home2.png",
                                height: 25,
                                width: 25,
                              ),
                              // labelText: name,
                              suffixIcon: Icon(
                                Icons.mic_none_outlined,
                                size: 20,
                                color: MyColors.iconColor,
                              ),

                              hintStyle: TextStyle(
                                color: Color.fromRGBO(70, 70, 70, 1),
                              ),
                              border: InputBorder.none,
                            ),
                          )),
                    )),
                right: 0,
              )
            ],
          )),
      body:
      Container(
        color: MyColors.backgroundColor,
        child: Obx(() {
          List presentedData= controller.homes.where((element) {
            if (controller.homeController.value.text.isEmpty) {
              return true;
            } else if (element.name.toString().toLowerCase().contains(
                controller.homeController.value.text.toLowerCase())) {
              return true;
            } else {
              return false;
            }
          }).toList();
          return
          controller.fetching.value?
           Center(
             child: Material(
              elevation: 5.0,
              color: Color(0xffeff0f5),
              shadowColor: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child:CircularProgressIndicator())),
           )
            :ListView.builder(
              itemBuilder: (context, index) {
                return
                      InkWell(
                        onTap: () {
                          controller.home = presentedData[index];
                          Get.toNamed(Routes.Details,
                              arguments: [presentedData[index]]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            elevation: 5.0,
                            color: Color(0xffeff0f5),
                            shadowColor: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Container(
                                height: 130,
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      ClipRRect(
                                        child: Image.network(
                                          presentedData[index].image,
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "\$",
                                                style: TextStyle(
                                                    color: MyColors.fontColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                              Text(
                                                presentedData[index].price ??
                                                    '',
                                                style: TextStyle(
                                                    color: MyColors.fontColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              )
                                            ],
                                          ),
                                          Text(
                                            presentedData[index].address,
                                            style: TextStyle(
                                                color: MyColors.fontColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight
                                                    .bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                  mainAxisSize: MainAxisSize
                                                      .min,
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/bed.png",
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                                    Text(
                                                      presentedData[index]
                                                          .bed,
                                                      style: TextStyle(
                                                          color: MyColors
                                                              .iconColor,
                                                          fontSize: 17,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ]),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              // Spacer(flex: 1,),
                                              Row(
                                                  mainAxisSize: MainAxisSize
                                                      .min,
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/path.png",
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                                    Text(
                                                      presentedData[index]
                                                          .path,
                                                      style: TextStyle(
                                                          color: MyColors
                                                              .iconColor,
                                                          fontSize: 17,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ]),
                                              SizedBox(
                                                width: 10,
                                              ),

                                              // Spacer(flex: 1,),
                                              Row(
                                                  mainAxisSize: MainAxisSize
                                                      .min,
                                                  children: [
                                                    Icon(
                                                      Icons.fullscreen,
                                                      color: MyColors.iconColor,
                                                    ),
                                                    Text(
                                                      presentedData[index]
                                                          .space,
                                                      style: TextStyle(
                                                          color: MyColors
                                                              .iconColor,
                                                          fontSize: 17,
                                                          fontWeight:
                                                          FontWeight.bold),
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
                                          )
                                        ],
                                      )
                                    ])),
                          ),
                        ),
                      );
              },
              itemCount: presentedData.length,
            );}),
      ),
    );
  }
}
