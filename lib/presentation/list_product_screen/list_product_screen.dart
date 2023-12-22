import '../list_product_screen/widgets/stackedcard_item_widget.dart';
import 'controller/list_product_controller.dart';
import 'models/stackedcard_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mykanji/core/app_export.dart';
import 'package:mykanji/widgets/app_bar/appbar_leading_image.dart';
import 'package:mykanji/widgets/app_bar/custom_app_bar.dart';
import 'package:mykanji/widgets/custom_icon_button.dart';
import 'package:mykanji/widgets/custom_search_view.dart';

class ListProductScreen extends GetWidget<ListProductController> {
  const ListProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: 412.h,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(height: 10.v),
                  _buildMainColumn(),
                  SizedBox(height: 16.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 16.h, right: 16.h, bottom: 5.v),
                              child: Column(children: [
                                _buildSearchRow(),
                                SizedBox(height: 20.v),
                                _buildNewListingColumn(),
                                SizedBox(height: 12.v),
                                _buildMediaColumn(),
                                SizedBox(height: 45.v),
                                SizedBox(
                                    width: 108.h,
                                    child: Divider(color: appTheme.gray90002))
                              ]))))
                ]))));
  }

  /// Section Widget
  Widget _buildMainColumn() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20.v),
        decoration: AppDecoration.fillGray5001,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomAppBar(
              height: 24.v,
              leadingWidth: 412.h,
              leading: AppbarLeadingImage(
                  imagePath: ImageConstant.imgIcon,
                  margin: EdgeInsets.fromLTRB(20.h, 4.v, 376.h, 4.v))),
          SizedBox(height: 51.v),
          Padding(
              padding: EdgeInsets.only(left: 16.h),
              child:
                  Text("lbl_sarees".tr, style: theme.textTheme.headlineMedium)),
          SizedBox(height: 11.v)
        ]));
  }

  /// Section Widget
  Widget _buildSearchRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: CustomSearchView(
              controller: controller.searchController,
              hintText: "msg_hinted_search_text".tr)),
      Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: CustomIconButton(
              height: 56.adaptSize,
              width: 56.adaptSize,
              padding: EdgeInsets.all(16.h),
              child: CustomImageView(imagePath: ImageConstant.imgSearch)))
    ]);
  }

  /// Section Widget
  Widget _buildNewListingColumn() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_new_listing".tr, style: CustomTextStyles.bodyLargeBlack900),
      SizedBox(height: 7.v),
      SizedBox(
          height: 258.v,
          child: Obx(() => ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 8.h);
              },
              itemCount: controller
                  .listProductModelObj.value.stackedcardItemList.value.length,
              itemBuilder: (context, index) {
                StackedcardItemModel model = controller
                    .listProductModelObj.value.stackedcardItemList.value[index];
                return StackedcardItemWidget(model);
              })))
    ]);
  }

  /// Section Widget
  Widget _buildMediaColumn() {
    return Column(children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Text("lbl_all_listing".tr,
              style: CustomTextStyles.bodyLargeBlack900)),
      SizedBox(height: 8.v),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: _buildAllListingColumn()),
        Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: _buildAllListingColumn())
      ]),
      SizedBox(height: 8.v),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: _buildAllListingColumn()),
        Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 4.h),
                decoration: AppDecoration.fillGray
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgMedia,
                          height: 182.v,
                          width: 186.h),
                      SizedBox(height: 18.v),
                      Padding(
                          padding: EdgeInsets.only(left: 16.h),
                          child: Text("lbl_sarees_6".tr,
                              style: theme.textTheme.bodyLarge)),
                      SizedBox(height: 3.v),
                      Padding(
                          padding: EdgeInsets.only(left: 16.h),
                          child: Text("lbl_3_500".tr,
                              style: theme.textTheme.bodyMedium)),
                      SizedBox(height: 16.v)
                    ])))
      ])
    ]);
  }

  /// Common widget
  Widget _buildAllListingColumn() {
    return Expanded(
        child: SizedBox(
            width: double.maxFinite,
            child: Container(
                decoration: AppDecoration.fillGray
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgMedia,
                      height: 182.v,
                      width: 186.h),
                  SizedBox(height: 18.v),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("lbl_sarees_4".tr,
                                style: theme.textTheme.bodyLarge),
                            SizedBox(height: 3.v),
                            Text("lbl_3_500".tr,
                                style: theme.textTheme.bodyMedium)
                          ])),
                  SizedBox(height: 16.v)
                ]))));
  }
}
