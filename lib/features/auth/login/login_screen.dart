/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percel_delivery_app/core/custom_assets/assets.gen.dart';
import 'package:percel_delivery_app/core/router/route_path.dart';
import 'package:percel_delivery_app/core/router/routes.dart';
import 'package:percel_delivery_app/helper/validator/text_field_validator.dart';
import 'package:percel_delivery_app/share/widgets/align/custom_align_text.dart';
import 'package:percel_delivery_app/share/widgets/button/custom_button.dart';
import 'package:percel_delivery_app/share/widgets/text_field/custom_text_field.dart';
import 'package:percel_delivery_app/utils/app_strings/app_strings.dart';
import 'package:percel_delivery_app/utils/color/app_colors.dart';
import 'package:percel_delivery_app/utils/common_controller/common_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          AppStrings.ntsamaela.tr,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(color: AppColors.primaryColor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    AppStrings.welcomeBack.tr,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800,
                      fontSize: 24.sp,
                      color: isDarkMode
                          ? AppColors.white
                          : AppColors.blackMainTextColor,
                    ),
                  ),
                  Gap(8),
                  */
/*    Text(
                    AppStrings.letsGetStarted.tr,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isDarkMode
                          ? Colors.black
                          : AppColors.grayTextSecondaryColor,
                    ),
                  ),*//*

                  Gap(24),
                  CustomTextField(
                    title: AppStrings.email.tr,
                    hintText: AppStrings.enterYourEmail.tr,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.mail_outline_outlined),
                    validator: TextFieldValidator.email(),
                  ),
                  Gap(14),
                  CustomTextField(
                    title: AppStrings.password.tr,
                    hintText: AppStrings.enterYourPassword.tr,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.lock_outline),
                    isPassword: true,
                    validator: TextFieldValidator.password(),
                  ),
                  Gap(14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      GestureDetector(
                        onTap: () => AppRouter.route.pushNamed(
                          RoutePath.forgetPasswordScreen,
                        ),
                        child: CustomAlignText(
                          text: AppStrings.forgotPassword.tr,
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                  Gap(28),
                  CustomButton(
                    text: AppStrings.signIn.tr,
                    onTap: () {
                      CommonController.to.isSeller.value == true
                          ? AppRouter.route.goNamed(RoutePath.driverNavScreen)
                          : AppRouter.route.goNamed(
                              RoutePath.parcelOwnerNavScreen,
                            );
                    },
                  ),
                  Gap(32),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.grayTextSecondaryColor,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          AppStrings.signInWith.tr,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w800,
                            fontSize: 14.sp,
                            color: isDarkMode
                                ? AppColors.white
                                : AppColors.blackMainTextColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.grayTextSecondaryColor,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  Gap(24),

                  /// ----------- SOCIAL ICONS ------------
                  Row(
                    spacing: 24,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            width: 1,
                            color: AppColors.blueTextColor400,
                          ),
                        ),
                        child: Assets.icons.google.svg(width: 22),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            width: 1,
                            color: AppColors.blueTextColor400,
                          ),
                        ),
                        child: Assets.icons.facebook.svg(width: 22),
                      ),
                    ],
                  ),
                  Gap(32),

                  /// ----------- New Here + Register ----------
                  Column(
                    spacing: 4,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.dontHaveAnAccount.tr,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),

                      GestureDetector(
                        onTap: () => AppRouter.route.pushNamed(
                          RoutePath.vendorSelectionScreen,
                        ),
                        child: Text(
                          AppStrings.signIn.tr,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.greenTextColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/
