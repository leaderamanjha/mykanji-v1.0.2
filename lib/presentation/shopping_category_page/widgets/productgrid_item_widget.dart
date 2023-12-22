import '../controller/shopping_category_controller.dart';
import '../models/productgrid_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mykanji/core/app_export.dart';

// ignore: must_be_immutable
class ProductgridItemWidget extends StatelessWidget {
  ProductgridItemWidget(
    this.productgridItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ProductgridItemModel productgridItemModelObj;

  var controller = Get.find<ShoppingCategoryController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => CustomImageView(
              imagePath: productgridItemModelObj.image?.value,
              height: 182.adaptSize,
              width: 182.adaptSize,
            ),
          ),
          SizedBox(height: 18.v),
          Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: Obx(
              () => Text(
                productgridItemModelObj.title!.value,
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ),
          SizedBox(height: 2.v),
          Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: Obx(
              () => Text(
                productgridItemModelObj.subhead!.value,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
          SizedBox(height: 17.v),
        ],
      ),
    );
  }
}
