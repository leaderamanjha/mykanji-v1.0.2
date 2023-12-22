// ignore_for_file: unused_import

import 'controller/sign_up_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:mykanji/core/app_export.dart';
import 'package:mykanji/core/utils/validation_functions.dart';
import 'package:mykanji/widgets/custom_elevated_button.dart';
import 'package:mykanji/widgets/custom_outlined_button.dart';
import 'package:mykanji/widgets/custom_text_form_field.dart';
import 'package:mykanji/data/models/registerUser/post_register_user_req.dart';
import 'package:mykanji/data/models/registerUser/post_register_user_resp.dart';

// ignore_for_file: must_be_immutable
class SignUpOneScreen extends GetWidget<SignUpOneController> {
  SignUpOneScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 21.v),
                    child: Column(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgLogo,
                          height: 80.adaptSize,
                          width: 80.adaptSize),
                      SizedBox(height: 29.v),
                      Text("lbl_sign_up".tr, style: theme.textTheme.titleLarge),
                      SizedBox(height: 25.v),
                      _buildInputWithLabelName(),
                      SizedBox(height: 13.v),
                      _buildInputWithLabelEmail(),
                      SizedBox(height: 6.v),
                      _buildInputWithLabelPassword(),
                      SizedBox(height: 12.v),
                      _buildInputWithLabelConfirmPassword(),
                      SizedBox(height: 27.v),
                      _buildContinueButton(),
                      SizedBox(height: 28.v),
                      _buildFrame(),
                      SizedBox(height: 26.v),
                      _buildSocialButtons(),
                      SizedBox(height: 28.v),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("msg_already_have_an".tr,
                                style: CustomTextStyles.bodyLargeSFProBlack900),
                            GestureDetector(
                                onTap: () {
                                  onTapTxtLogIn();
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(left: 6.h),
                                    child: Text("lbl_login".tr,
                                        style: CustomTextStyles
                                            .titleMediumBlue300
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.underline))))
                          ]),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  Widget _buildInputWithLabelName() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_name".tr, style: theme.textTheme.bodySmall),
      SizedBox(height: 6.v),
      CustomTextFormField(
          controller: controller.nameController,
          hintText: "Enter Your Name",
          prefix: Container(
              margin: EdgeInsets.fromLTRB(14.h, 10.v, 8.h, 10.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgMail,
                  height: 20.adaptSize,
                  width: 20.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 41.v),
          contentPadding: EdgeInsets.only(top: 10.v, right: 30.h, bottom: 10.v),
          borderDecoration: TextFormFieldStyleHelper.outlineBlueGray)
    ]);
  }

  /// Section Widget
  Widget _buildInputWithLabelEmail() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_phone_number_e_mail".tr, style: theme.textTheme.bodySmall),
      SizedBox(height: 5.v),
      CustomTextFormField(
          controller: controller.emailController,
          hintText: "Enter Your Mobile Number",
          prefix: Container(
              margin: EdgeInsets.fromLTRB(14.h, 10.v, 8.h, 10.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgMail,
                  height: 20.adaptSize,
                  width: 20.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 41.v),
          contentPadding: EdgeInsets.only(top: 10.v, right: 30.h, bottom: 10.v),
          borderDecoration: TextFormFieldStyleHelper.outlineBlueGray)
    ]);
  }

  /// Section Widget
  Widget _buildInputWithLabelPassword() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_password".tr, style: theme.textTheme.bodySmall),
      SizedBox(height: 6.v),
      CustomTextFormField(
          controller: controller.passwordController,
          hintText: "Enter Secured Password ",
          prefix: Container(
              margin: EdgeInsets.fromLTRB(14.h, 10.v, 8.h, 10.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgPassword,
                  height: 20.adaptSize,
                  width: 20.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 41.v),
          suffix: Container(
              margin: EdgeInsets.fromLTRB(30.h, 12.v, 14.h, 12.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgEyeOpen,
                  height: 16.adaptSize,
                  width: 16.adaptSize)),
          suffixConstraints: BoxConstraints(maxHeight: 41.v))
    ]);
  }

  /// Section Widget
  Widget _buildConfirmpassword() {
    return Obx(() => CustomTextFormField(
        controller: controller.confirmpasswordController,
        hintText: "Confirm Your Secured Password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(14.h, 10.v, 8.h, 10.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgPassword,
                height: 20.adaptSize,
                width: 20.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 41.v),
        suffix: InkWell(
            onTap: () {
              controller.isShowPassword.value =
                  !controller.isShowPassword.value;
            },
            child: Container(
                margin: EdgeInsets.fromLTRB(30.h, 12.v, 14.h, 12.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgEyeOpen,
                    height: 16.adaptSize,
                    width: 16.adaptSize))),
        suffixConstraints: BoxConstraints(maxHeight: 41.v),
        obscureText: controller.isShowPassword.value));
  }

  /// Section Widget
  Widget _buildInputWithLabelConfirmPassword() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_confirm_password".tr, style: theme.textTheme.bodySmall),
      SizedBox(height: 6.v),
      _buildConfirmpassword()
    ]);
  }

  /// Section Widget
  Widget _buildContinueButton() {
    return CustomElevatedButton(
        text: "lbl_continue".tr,
        buttonStyle: CustomButtonStyles.outlinePrimary,
        onPressed: () {
          onTapContinueButton();
        });
  }

  /// Section Widget
  Widget _buildFrame() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 8.v, bottom: 10.v),
              child: SizedBox(width: 174.h, child: Divider())),
          Text("lbl_or".tr, style: CustomTextStyles.bodyLargeSFProGray800),
          Padding(
              padding: EdgeInsets.only(top: 8.v, bottom: 10.v),
              child: SizedBox(width: 174.h, child: Divider()))
        ]);
  }

  /// Section Widget
  Widget _buildSignUpWithGoogleButton() {
    return CustomOutlinedButton(
        text: "msg_sign_up_with_google".tr,
        leftIcon: Container(
            margin: EdgeInsets.only(right: 12.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgSocialIcon,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        buttonStyle: CustomButtonStyles.outlineBlueGray);
  }

  /// Section Widget
  Widget _buildSignUpWithFacebookButton() {
    return CustomElevatedButton(
        height: 44.v,
        text: "msg_sign_up_with_facebook".tr,
        leftIcon: Container(
            margin: EdgeInsets.only(right: 12.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgSocialIconOnerrorcontainer,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        buttonStyle: CustomButtonStyles.outlinePrimaryTL12);
  }

  /// Section Widget
  Widget _buildSignUpWithAppleButton() {
    return CustomElevatedButton(
        height: 44.v,
        text: "msg_sign_up_with_apple".tr,
        leftIcon: Container(
            margin: EdgeInsets.only(right: 12.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgAppleSocialIcon,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        buttonStyle: CustomButtonStyles.outlinePrimaryTL121);
  }

  /// Section Widget
  Widget _buildSocialButtons() {
    return Column(children: [
      _buildSignUpWithGoogleButton(),
      SizedBox(height: 12.v),
      _buildSignUpWithFacebookButton(),
      SizedBox(height: 12.v),
      _buildSignUpWithAppleButton()
    ]);
  }

  /// calls the [https://dull-jade-drill-tutu.cyclic.app/auth/register] API
  ///
  /// validates the form input fields and executes the API if all the fields are valid
  /// It has [PostRegisterUserReq] as a parameter which will be passed as a API request body
  /// If the call is successful, the function calls the `_onRegistrationSuccess()` function.
  /// If the call fails, the function calls the `_onRegistrationError()` function.
  ///
  /// Throws a `NoInternetException` if there is no internet connection.
  Future<void> onTapContinueButton() async {
    if (_formKey.currentState!.validate()) {
      PostRegisterUserReq postRegisterUserReq = PostRegisterUserReq(
        name: controller.nameController.text,
        userName: controller.emailController.text,
        password: controller.passwordController.text,
        confirmPassword: controller.confirmpasswordController.text,
      );
      try {
        await controller.callRegisterUser(
          postRegisterUserReq.toJson(),
        );
        _onRegistrationSuccess();
      } on PostRegisterUserResp {
        _onRegistrationError();
      } on NoInternetException catch (e) {
        Get.rawSnackbar(message: e.toString());
      } catch (e) {
        //TODO: Handle generic errors
      }
    }
  }

  /// Navigates to the signupotpScreen when the action is triggered.
  void _onRegistrationSuccess() {
    Get.toNamed(
      AppRoutes.signupotpScreen,
    );
  }

  /// Displays an alert dialog when the action is triggered.
  /// The dialog box contains a title and a message with the `Retry`
  void _onRegistrationError() {
    Get.defaultDialog(
        onConfirm: () => Get.back(), title: "Failed", middleText: "Retry");
  }

  /// Navigates to the logintwoScreen when the action is triggered.
  onTapTxtLogIn() {
    Get.toNamed(
      AppRoutes.logintwoScreen,
    );
  }
}
