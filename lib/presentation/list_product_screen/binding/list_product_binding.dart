import '../controller/list_product_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ListProductScreen.
///
/// This class ensures that the ListProductController is created when the
/// ListProductScreen is first loaded.
class ListProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListProductController());
  }
}
