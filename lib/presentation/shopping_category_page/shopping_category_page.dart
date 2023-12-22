import '../shopping_category_page/widgets/productgrid_item_widget.dart';
import 'controller/shopping_category_controller.dart';
import 'models/productgrid_item_model.dart';
import 'models/shopping_category_model.dart';
import 'package:flutter/material.dart';
import 'package:mykanji/core/app_export.dart';
import 'package:mykanji/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class ShoppingCategoryPage extends StatelessWidget {
  ShoppingCategoryPage({Key? key}) : super(key: key);

  ShoppingCategoryController controller =
      Get.put(ShoppingCategoryController(ShoppingCategoryModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(height: 20.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: Column(children: [
                        CustomSearchView(
                            controller: controller.searchController,
                            hintText: "msg_hinted_search_text".tr),
                        SizedBox(height: 16.v),
                        _buildProductGrid(),
                        SizedBox(height: 107.v),
                        SizedBox(
                            width: 108.h,
                            child: Divider(color: appTheme.gray90002))
                      ]))
                ])))));
  }

  /// Section Widget
  Widget _buildProductGrid() {
    return Obx(() => GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 259.v,
            crossAxisCount: 2,
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 16.h),
        physics: BouncingScrollPhysics(),
        itemCount: controller
            .shoppingCategoryModelObj.value.productgridItemList.value.length,
        itemBuilder: (context, index) {
          ProductgridItemModel model = controller
              .shoppingCategoryModelObj.value.productgridItemList.value[index];
          return ProductgridItemWidget(model);
        }));
  }
}
