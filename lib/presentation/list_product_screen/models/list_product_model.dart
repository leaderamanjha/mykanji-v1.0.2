import 'package:mykanji/core/app_export.dart';

import 'stackedcard_item_model.dart';

/// This class defines the variables used in the [list_product_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ListProductModel {
  Rx<List<StackedcardItemModel>> stackedcardItemList = Rx([
    StackedcardItemModel(
        titleText: "Zari Pure Silk \nPaithani Saree".obs,
        subheadText: "₹3,500".obs),
    StackedcardItemModel(titleText: "Sarees 2".obs, subheadText: "₹3,500".obs)
  ]);
}
