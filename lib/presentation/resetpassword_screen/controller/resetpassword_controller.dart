import 'package:mykanji/core/app_export.dart';
import 'package:mykanji/presentation/resetpassword_screen/models/resetpassword_model.dart';
import 'package:flutter/material.dart';
import 'package:mykanji/data/models/resetPasswordApi/post_reset_password_api_resp.dart';
import 'package:mykanji/data/apiClient/api_client.dart';

/// A controller class for the ResetpasswordScreen.
///
/// This class manages the state of the ResetpasswordScreen, including the
/// current resetpasswordModelObj
class ResetpasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  Rx<ResetpasswordModel> resetpasswordModelObj = ResetpasswordModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;

  PostResetPasswordApiResp postResetPasswordApiResp =
      PostResetPasswordApiResp();

  @override
  void onClose() {
    super.onClose();
    passwordController.dispose();
    confirmpasswordController.dispose();
  }

  /// Calls the https://dull-jade-drill-tutu.cyclic.app/auth/resetPassword API with the specified request data.
  ///
  /// The [Map] parameter represents request body
  Future<void> callResetPasswordApi(Map req) async {
    try {
      postResetPasswordApiResp = await Get.find<ApiClient>().resetPasswordApi(
        headers: {
          'Content-type': 'application/json',
        },
        requestData: req,
      );
      _handleResetPasswordApiSuccess();
    } on PostResetPasswordApiResp catch (e) {
      postResetPasswordApiResp = e;
      rethrow;
    }
  }

  /// handles the success response for the API
  void _handleResetPasswordApiSuccess() {
    Get.find<PrefUtils>().setResetpass(postResetPasswordApiResp.message ?? '');
  }
}
