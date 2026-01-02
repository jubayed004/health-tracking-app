/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percel_delivery_app/core/router/route_path.dart';
import 'package:percel_delivery_app/core/router/routes.dart';
import 'package:percel_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:percel_delivery_app/helper/validator/text_field_validator.dart';
import 'package:percel_delivery_app/share/widgets/button/custom_button.dart';
import 'package:percel_delivery_app/share/widgets/text_field/custom_text_field.dart';
import 'package:percel_delivery_app/utils/app_strings/app_strings.dart';
import 'package:percel_delivery_app/utils/color/app_colors.dart';
import 'package:percel_delivery_app/utils/extension/base_extension.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _resetPassword = TextEditingController();
  final TextEditingController _resetConfirmPassword = TextEditingController();
  final AuthController _auth = Get.find<AuthController>();

  @override
  void dispose() {
    _resetPassword.dispose();
    _resetConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title:Text(
          AppStrings.ntsamaela.tr,
          style: context.headlineSmall.copyWith(
            color:  AppColors.primaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// ---------- MAIN TITLE ----------
                Text(
                  AppStrings.createNewPassword.tr,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w800,
                    fontSize: 24.sp,
                    color: isDarkMode ? AppColors.white : const Color(0xFF1D242D),
                  ),
                ),
                Gap(12.h),

                /// ---------- SUBTITLE ----------
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    AppStrings.createNewPasswordTitle.tr,
                    textAlign: TextAlign.center,
                    style: context.bodyMedium.copyWith(color: AppColors.grayTextSecondaryColor),
                  ),
                ),
                Gap(32.h),

                /// ---------- New Password Input ----------
                CustomTextField(
                  title: AppStrings.newPassword.tr,
                  hintText: AppStrings.enterYourNewPassword.tr,
                  keyboardType: TextInputType.text,
                  prefixIcon: const Icon(Icons.lock_outline),
                  isPassword: true,
                  controller: _resetPassword,
                  validator: TextFieldValidator.password(),
                  onChanged: (value) {
                    _auth.password.value = value;
                  },
                ),
                Gap(16.h),

                /// ---------- Password Rule Checklist ----------
     */
/*           Obx(() => buildCheckItem(AppStrings.minimum8Characters.tr, _auth.hasMinLength)),
                Obx(() => buildCheckItem(AppStrings.oneNumber.tr, _auth.hasNumber)),
                Obx(() => buildCheckItem(AppStrings.oneUppercaseLetter.tr, _auth.hasUppercase)),*//*

                Gap(24.h),

                /// ---------- Confirm Password ----------
                CustomTextField(
                  title: AppStrings.confirmNewPassword.tr,
                  hintText: AppStrings.confirmYourNewPassword.tr,
                  keyboardType: TextInputType.text,
                  prefixIcon: const Icon(Icons.lock_outline),
                  isPassword: true,
                  controller: _resetConfirmPassword,
                  validator: TextFieldValidator.confirmPassword(_resetPassword),
                ),
                Gap(40.h),

                /// ---------- Confirm Button ----------
                CustomButton(
                  text: AppStrings.confirm.tr,
                  onTap: () {
                  */
/*  if (_formKey.currentState!.validate()) {
                      Get.snackbar("Success", "Password reset successful!", snackPosition: SnackPosition.BOTTOM);
                    }*//*


                   AppRouter.route.goNamed(RoutePath.loginScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
