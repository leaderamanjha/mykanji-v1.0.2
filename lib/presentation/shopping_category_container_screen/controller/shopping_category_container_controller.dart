import 'package:mykanji/core/app_export.dart';
import 'package:mykanji/presentation/shopping_category_container_screen/models/shopping_category_container_model.dart';

/// A controller class for the ShoppingCategoryContainerScreen.
///
/// This class manages the state of the ShoppingCategoryContainerScreen, including the
/// current shoppingCategoryContainerModelObj
class ShoppingCategoryContainerController extends GetxController {
  Rx<ShoppingCategoryContainerModel> shoppingCategoryContainerModelObj =
      ShoppingCategoryContainerModel().obs;
}
