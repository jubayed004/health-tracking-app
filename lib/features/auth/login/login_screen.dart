import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:health_tracker_app/core/custom_assets/assets.gen.dart';
import 'package:health_tracker_app/core/router/route_path.dart';
import 'package:health_tracker_app/core/router/routes.dart';
import 'package:health_tracker_app/share/widgets/button/custom_button.dart';
import 'package:health_tracker_app/share/widgets/text_field/custom_text_field.dart';
import 'package:health_tracker_app/utils/app_strings/app_strings.dart';
import 'package:health_tracker_app/utils/color/app_colors.dart';
import 'package:health_tracker_app/utils/extension/base_extension.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Top Section
            Expanded(
              flex: 4,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.appLogo.svg(width: 120),
                    const Gap(20),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 20,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.signIn.tr,
                      style: context.headlineMedium.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      AppStrings.getStarted.tr,
                      style: context.titleMedium.copyWith(
                        color: AppColors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 7,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Gap(24),
                        CustomTextField(
                          controller: _emailController,
                          title: null,
                          hintText: AppStrings.enterEmailAddress.tr,
                        ),
                        const Gap(16),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: AppStrings.enterPassword.tr,
                          isPassword: true,
                        ),
                        const Gap(24),
                        CustomButton(
                          text: AppStrings.signIn.tr,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              // Handle sign in
                            }
                          },
                        ),
                        const Gap(16),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              // Handle forgot password
                            },
                            child: Text(
                              AppStrings.forgotPassword.tr,
                              style: context.bodyMedium.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const Gap(30),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppStrings.dontHaveAccount.tr,
                            style: context.titleSmall.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Gap(12),
                        OutlinedButton(
                          onPressed: () {
                            AppRouter.route.pushNamed(RoutePath.signUpScreen);
                          },
                          style: context.outlinedButtonStyle.copyWith(
                            foregroundColor: WidgetStateProperty.all(
                              AppColors.primaryColor,
                            ),
                          ),
                          child: Text(
                            AppStrings.createNewAccount.tr,
                            style: context.bodyMedium.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Gap(24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
