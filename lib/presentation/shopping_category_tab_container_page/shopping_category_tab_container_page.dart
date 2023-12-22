// ignore_for_file: must_be_immutable

import 'controller/shopping_category_tab_container_controller.dart';
import 'models/shopping_category_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:mykanji/core/app_export.dart';
import 'package:mykanji/presentation/shopping_category_page/shopping_category_page.dart';
import 'package:mykanji/widgets/app_bar/appbar_leading_image.dart';
import 'package:mykanji/widgets/app_bar/appbar_subtitle.dart';
import 'package:mykanji/widgets/app_bar/appbar_trailing_image.dart';
import 'package:mykanji/widgets/app_bar/custom_app_bar.dart';
import 'package:mykanji/widgets/custom_outlined_button.dart';

class ShoppingCategoryTabContainerPage extends StatelessWidget {
  ShoppingCategoryTabContainerPage({Key? key})
      : super(
          key: key,
        );

  ShoppingCategoryTabContainerController controller = Get.put(
      ShoppingCategoryTabContainerController(
          ShoppingCategoryTabContainerModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SizedBox(
          width: 412.h,
          child: Column(
            children: [
              SizedBox(height: 20.v),
              Container(
                height: 40.v,
                width: 216.h,
                child: TabBar(
                  controller: controller.tabviewController,
                  labelPadding: EdgeInsets.zero,
                  labelColor: appTheme.gray90001,
                  labelStyle: TextStyle(
                    fontSize: 14.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedLabelColor: appTheme.gray90003,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 14.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                  indicator: BoxDecoration(
                    color: appTheme.deepPurple5001,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(8.h),
                    ),
                    border: Border.all(
                      color: appTheme.gray600,
                      width: 1.h,
                    ),
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(8.h, 8.v, 8.h, 10.v),
                        decoration: AppDecoration.outlineGray600.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL8,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusStyle.customBorderTL8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgCheckmark,
                                height: 18.adaptSize,
                                width: 18.adaptSize,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.h),
                                child: Text(
                                  "lbl_shopping".tr,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: CustomOutlinedButton(
                        height: 40.v,
                        width: 108.h,
                        text: "lbl_sell_now".tr,
                        buttonStyle: CustomButtonStyles.outlineGrayLR8,
                        buttonTextStyle: theme.textTheme.titleSmall!,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 915.v,
                  child: TabBarView(
                    controller: controller.tabviewController,
                    children: [
                      ShoppingCategoryPage(),
                      ShoppingCategoryPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 64.v,
      leadingWidth: 40.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgLinkedin,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 20.v,
          bottom: 20.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "lbl_koramangala".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgLock,
          margin: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 20.v,
          ),
        ),
      ],
      styleType: Style.bgFill,
    );
  }
}
