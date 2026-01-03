import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:health_tracker_app/core/router/routes.dart';
import 'package:health_tracker_app/share/widgets/button/circular_arrow_button.dart';
import 'package:health_tracker_app/share/widgets/button/custom_back_button.dart';
import 'package:health_tracker_app/share/widgets/button/custom_button.dart';
import 'package:health_tracker_app/utils/app_strings/app_strings.dart';
import 'package:health_tracker_app/utils/color/app_colors.dart';
import 'package:health_tracker_app/utils/extension/base_extension.dart';

class ChooseGenderScreen extends StatefulWidget {
  const ChooseGenderScreen({super.key});

  @override
  State<ChooseGenderScreen> createState() => _ChooseGenderScreenState();
}

class _ChooseGenderScreenState extends State<ChooseGenderScreen> {
  // Using ValueNotifier for the selected gender
  final ValueNotifier<String> _selectedGender = ValueNotifier<String>("");

  final List<String> _genders = [
    AppStrings.male,
    AppStrings.female,
    AppStrings.other,
  ];

  @override
  void dispose() {
    _selectedGender.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // back Button
              CircularArrowButton(onTap: () => AppRouter.route.pop()),
              const Gap(32),
              Text(
                AppStrings.chooseYourGender.tr,
                style: context.headlineMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackMainTextColor,
                ),
              ),
              const Gap(32),

              // Gender Options List
              ValueListenableBuilder<String>(
                valueListenable: _selectedGender,
                builder: (context, selectedValue, _) {
                  return Column(
                    children: _genders.map((genderKey) {
                      final isSelected = selectedValue == genderKey;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: GestureDetector(
                          onTap: () {
                            _selectedGender.value = genderKey;
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primaryColor
                                  : AppColors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primaryColor
                                    : AppColors.linesDarkColor.withValues(
                                        alpha: 0.5,
                                      ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                genderKey.tr,
                                style: context.titleMedium.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? AppColors.white
                                      : AppColors.blackMainTextColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),

              const Spacer(),

              // Continue Button
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomButton(
                  text: AppStrings.continueText.tr,
                  onTap: () {
                    // Navigate to next screen
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
