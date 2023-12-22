import 'package:mykanji/core/app_export.dart';
import 'package:mykanji/presentation/sign_up_one_screen/models/sign_up_one_model.dart';
import 'package:flutter/material.dart';
import 'package:mykanji/data/models/registerUser/post_register_user_resp.dart';
import 'package:mykanji/data/apiClient/api_client.dart';

/// A controller class for the SignUpOneScreen.
///
/// This class manages the state of the SignUpOneScreen, including the
/// current signUpOneModelObj
class SignUpOneController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  Rx<SignUpOneModel> signUpOneModelObj = SignUpOneModel().obs;

  Rx<bool> isShowPassword = true.obs;

  PostRegisterUserResp postRegisterUserResp = PostRegisterUserResp();

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
  }

  /// Calls the https://dull-jade-drill-tutu.cyclic.app/auth/register API with the specified request data.
  ///
  /// The [Map] parameter represents request body
  Future<void> callRegisterUser(Map req) async {
    try {
      postRegisterUserResp = await Get.find<ApiClient>().registerUser(
        headers: {
          'Content-type': 'application/json',
        },
        requestData: req,
      );
      _handleRegisterUserSuccess();
    } on PostRegisterUserResp catch (e) {
      postRegisterUserResp = e;
      rethrow;
    }
  }

  /// handles the success response for the API
  void _handleRegisterUserSuccess() {
    Get.find<PrefUtils>()
        .setRegistrationSucess(postRegisterUserResp.message ?? '');
  }
}
