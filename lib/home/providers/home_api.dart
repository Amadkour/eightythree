import 'package:get/get.dart';

import 'home.dart';

class HomeApi extends GetConnect {
  @override
  void onInit() {
    getHomes();
    super.onInit();
  }

  Future<List<Home>> getHomes() async {
    List<Home> homes = [];

    ///------------ get request-----------------//
    final response = await get(
      "https://fakestoreapi.com/products",
    );

    ///------------ map api response into a List of Home Model -----------------//
    response.body.forEach((v) {
      ///-------map json object into Home model---------///
      homes.add(Home.fromJson(v));
    });
    return homes;
  }
}
