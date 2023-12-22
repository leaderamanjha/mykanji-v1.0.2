// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mykanji/core/app_export.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHome,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavOrders,
      activeIcon: ImageConstant.imgNavOrders,
      title: "lbl_orders".tr,
      type: BottomBarEnum.Orders,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavReplies,
      activeIcon: ImageConstant.imgNavReplies,
      title: "lbl_replies".tr,
      type: BottomBarEnum.Replies,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCartGray90004,
      activeIcon: ImageConstant.imgCartGray90004,
      title: "lbl_cart".tr,
      type: BottomBarEnum.Cart,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.v,
      decoration: BoxDecoration(
        color: appTheme.purple50,
      ),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: bottomMenuList[index].icon,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    color: appTheme.gray90004,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.v),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: appTheme.gray80001,
                      ),
                    ),
                  ),
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: bottomMenuList[index].activeIcon,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    color: appTheme.black900,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 9.v),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: appTheme.gray80001,
                      ),
                    ),
                  ),
                ],
              ),
              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Orders,
  Replies,
  Cart,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
