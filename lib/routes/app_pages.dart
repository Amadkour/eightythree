
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/route_manager.dart';
import 'package:eightythree/home/bindings/home_binding.dart';
import 'package:eightythree/home/views/details_view.dart';
import 'package:eightythree/home/views/home_view.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.Home;

  static final routes = [
    GetPage(
      name: _Paths.Home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.Details,
      transition: Transition.size,
      page: () => DetailsView(),
      binding: HomeBinding(),
    ),

  ];
}
