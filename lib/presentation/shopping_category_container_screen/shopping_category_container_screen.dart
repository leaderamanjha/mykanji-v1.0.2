import 'controller/shopping_category_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:mykanji/core/app_export.dart';
import 'package:mykanji/presentation/shopping_category_tab_container_page/shopping_category_tab_container_page.dart';
import 'package:mykanji/widgets/custom_bottom_bar.dart';

class ShoppingCategoryContainerScreen
    extends GetWidget<ShoppingCategoryContainerController> {
  const ShoppingCategoryContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: AppRoutes.shoppingCategoryTabContainerPage,
                onGenerateRoute: (routeSetting) => GetPageRoute(
                    page: () => getCurrentPage(routeSetting.name!),
                    transition: Transition.noTransition)),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), id: 1);
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return "/";
      case BottomBarEnum.Orders:
        return "/";
      case BottomBarEnum.Replies:
        return AppRoutes.shoppingCategoryTabContainerPage;
      case BottomBarEnum.Cart:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.shoppingCategoryTabContainerPage:
        return ShoppingCategoryTabContainerPage();
      default:
        return DefaultWidget();
    }
  }
}
