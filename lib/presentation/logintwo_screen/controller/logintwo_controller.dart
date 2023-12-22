import 'package:mykanji/core/app_export.dart';
import 'package:mykanji/presentation/logintwo_screen/models/logintwo_model.dart';
import 'package:flutter/material.dart';
import 'package:mykanji/data/models/loginAuth/get_login_auth_resp.dart';
import 'package:mykanji/data/apiClient/api_client.dart';

/// A controller class for the LogintwoScreen.
///
/// This class manages the state of the LogintwoScreen, including the
/// current logintwoModelObj
class LogintwoController extends GetxController {
  TextEditingController emailInputController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<LogintwoModel> logintwoModelObj = LogintwoModel().obs;

  Rx<bool> isShowPassword = true.obs;

  GetLoginAuthResp getLoginAuthResp = GetLoginAuthResp();

  @override
  void onClose() {
    super.onClose();
    emailInputController.dispose();
    passwordController.dispose();
  }

  /// Calls the https://dull-jade-drill-tutu.cyclic.app/auth/category-getall/:id API with the specified request data.
  ///
  /// The [Map] parameter represents request body
  Future<void> callLoginAuth({String? id}) async {
    try {
      getLoginAuthResp = await Get.find<ApiClient>().loginAuth(
        headers: {
          'Content-type': 'application/json',
        },
        id: id,
      );
      _handleLoginAuthSuccess();
    } on GetLoginAuthResp catch (e) {
      getLoginAuthResp = e;
      rethrow;
    }
  }

  /// handles the success response for the API
  void _handleLoginAuthSuccess() {
    Get.find<PrefUtils>().setToken(getLoginAuthResp.token ?? '');
  }
}
