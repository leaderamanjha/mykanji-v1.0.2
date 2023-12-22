import '../../../core/app_export.dart';

/// This class is used in the [stackedcard_item_widget] screen.
class StackedcardItemModel {
  StackedcardItemModel({
    this.sareeImage,
    this.titleText,
    this.subheadText,
    this.id,
  }) {
    sareeImage = sareeImage ?? Rx("...");
    titleText = titleText ?? Rx("Zari Pure Silk \nPaithani Saree");
    subheadText = subheadText ?? Rx("₹3,500");
    id = id ?? Rx("");
  }

  Rx<String>? sareeImage;

  Rx<String>? titleText;

  Rx<String>? subheadText;

  Rx<String>? id;
}
