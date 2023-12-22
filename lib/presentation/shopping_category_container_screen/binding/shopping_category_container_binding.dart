import '../controller/shopping_category_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ShoppingCategoryContainerScreen.
///
/// This class ensures that the ShoppingCategoryContainerController is created when the
/// ShoppingCategoryContainerScreen is first loaded.
class ShoppingCategoryContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShoppingCategoryContainerController());
  }
}
