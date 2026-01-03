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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
              flex: 3,
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
                      AppStrings.signUp.tr.toUpperCase(),
                      style: context.headlineMedium.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      AppStrings.toGetStarted.tr,
                      style: context.titleMedium.copyWith(
                        color: AppColors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 10,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(24),
                        CustomTextField(
                          controller: _nameController,
                          title: null,
                          hintText: AppStrings.enterYourName.tr,
                        ),
                        const Gap(16),
                        CustomTextField(
                          controller: _emailController,
                          title: null,
                          hintText: AppStrings.enterYourEmail.tr,
                        ),
                        const Gap(16),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: AppStrings.enterPassword.tr,
                          isPassword: true,
                        ),
                        const Gap(16),
                        CustomTextField(
                          controller: _confirmPasswordController,
                          hintText: AppStrings.confirmPassword.tr,
                          isPassword: true,
                        ),
                        const Gap(24),
                        CustomButton(
                          text: AppStrings.createAccount.tr,
                          onTap: () {
                            // if (_formKey.currentState!.validate()) {
                            //   // Handle sign up
                            // }
                            AppRouter.route.pushNamed(
                              RoutePath.activeOtpScreen,
                            );
                          },
                        ),
                        const Gap(24),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppStrings.alreadyHaveAccount.tr,
                            style: context.titleSmall.copyWith(),
                          ),
                        ),
                        const Gap(12),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              AppRouter.route.goNamed(RoutePath.loginScreen);
                            },
                            child: Text(AppStrings.loginExistingAccount.tr),
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
