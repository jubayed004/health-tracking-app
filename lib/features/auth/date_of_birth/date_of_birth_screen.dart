import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:health_tracker_app/core/router/route_path.dart';
import 'package:health_tracker_app/core/router/routes.dart';
import 'package:health_tracker_app/share/widgets/button/circular_arrow_button.dart';
import 'package:health_tracker_app/share/widgets/button/custom_button.dart';
import 'package:health_tracker_app/utils/app_strings/app_strings.dart';
import 'package:health_tracker_app/utils/color/app_colors.dart';
import 'package:health_tracker_app/utils/extension/base_extension.dart';

class DateOfBirthScreen extends StatefulWidget {
  const DateOfBirthScreen({super.key});

  @override
  State<DateOfBirthScreen> createState() => _DateOfBirthScreenState();
}

class _DateOfBirthScreenState extends State<DateOfBirthScreen> {
  // Initial Values
  final ValueNotifier<int> _selectedMonthIndex = ValueNotifier<int>(
    4,
  ); // May (Index 4)
  final ValueNotifier<int> _selectedDateIndex = ValueNotifier<int>(
    12,
  ); // 13 (Index 12)
  final ValueNotifier<int> _selectedYearIndex = ValueNotifier<int>(
    14,
  ); // 2004 (if starting from 1990: 1990+14 = 2004)

  // Data
  final List<String> _months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  final List<int> _dates = List.generate(31, (index) => index + 1);

  // Years from 1950 to 2015 (User born before 2015 usually)
  final List<int> _years = List.generate(70, (index) => 1950 + index);

  @override
  void dispose() {
    _selectedMonthIndex.dispose();
    _selectedDateIndex.dispose();
    _selectedYearIndex.dispose();
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
              // Back Button
              CircularArrowButton(onTap: () => AppRouter.route.pop()),
              const Gap(32),

              Text(
                AppStrings.whenWereYouBorn.tr,
                style: context.headlineMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackMainTextColor,
                ),
              ),
              const Gap(32),

              // Pickers Row
              Expanded(
                child: Row(
                  children: [
                    // Month Picker
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Text(
                            AppStrings.month.tr,
                            style: context.titleLarge.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackMainTextColor,
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            child: _buildWheelPicker(
                              itemCount: _months.length,
                              onChanged: (index) {
                                _selectedMonthIndex.value = index;
                              },
                              itemBuilder: (context, index) {
                                return _buildPickerItem(
                                  _months[index],
                                  index,
                                  _selectedMonthIndex,
                                );
                              },
                              controller: FixedExtentScrollController(
                                initialItem: _selectedMonthIndex.value,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Date Picker
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(
                            AppStrings.date.tr,
                            style: context.titleLarge.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackMainTextColor,
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            child: _buildWheelPicker(
                              itemCount: _dates.length,
                              onChanged: (index) {
                                _selectedDateIndex.value = index;
                              },
                              itemBuilder: (context, index) {
                                return _buildPickerItem(
                                  _dates[index].toString(),
                                  index,
                                  _selectedDateIndex,
                                );
                              },
                              controller: FixedExtentScrollController(
                                initialItem: _selectedDateIndex.value,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Year Picker
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(
                            AppStrings.year.tr,
                            style: context.titleLarge.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackMainTextColor,
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            child: _buildWheelPicker(
                              itemCount: _years.length,
                              onChanged: (index) {
                                _selectedYearIndex.value = index;
                              },
                              itemBuilder: (context, index) {
                                return _buildPickerItem(
                                  _years[index].toString(),
                                  index,
                                  _selectedYearIndex,
                                );
                              },
                              controller: FixedExtentScrollController(
                                initialItem: _selectedYearIndex.value,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Gap(20),

              // Continue Button
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomButton(
                  text: AppStrings.continueText.tr,
                  onTap: () {
                    // Navigate to next screen or verify
                    final month = _months[_selectedMonthIndex.value];
                    final date = _dates[_selectedDateIndex.value];
                    final year = _years[_selectedYearIndex.value];
                    print("Born: $month $date, $year");
                    context.pushNamed(RoutePath.thankYouScreen);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWheelPicker({
    required int itemCount,
    required ValueChanged<int> onChanged,
    required Widget Function(BuildContext, int) itemBuilder,
    required FixedExtentScrollController controller,
  }) {
    return ListWheelScrollView.useDelegate(
      controller: controller,
      itemExtent: 50,
      perspective: 0.005,
      diameterRatio: 1.2,
      physics: const FixedExtentScrollPhysics(),
      onSelectedItemChanged: onChanged,
      childDelegate: ListWheelChildBuilderDelegate(
        childCount: itemCount,
        builder: itemBuilder,
      ),
    );
  }

  Widget _buildPickerItem(
    String text,
    int index,
    ValueNotifier<int> selectedIndexNotifier,
  ) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedIndexNotifier,
      builder: (context, selectedIndex, _) {
        final isSelected = selectedIndex == index;
        return Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: isSelected ? context.headlineSmall : context.titleMedium,
            child: Container(
              padding: isSelected
                  ? const EdgeInsets.symmetric(horizontal: 12, vertical: 6)
                  : null,
              decoration: isSelected
                  ? BoxDecoration(
                      color: AppColors.bgSecondaryButtonColor,
                      borderRadius: BorderRadius.circular(20),
                    )
                  : null,
              child: Text(text),
            ),
          ),
        );
      },
    );
  }
}
