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

class ChooseHeightWeightScreen extends StatefulWidget {
  const ChooseHeightWeightScreen({super.key});

  @override
  State<ChooseHeightWeightScreen> createState() =>
      _ChooseHeightWeightScreenState();
}

class _ChooseHeightWeightScreenState extends State<ChooseHeightWeightScreen> {
  // ValueNotifiers for state
  final ValueNotifier<bool> _isMetric = ValueNotifier<bool>(
    false,
  ); // Start with Imperial to match design
  final ValueNotifier<int> _selectedCmIndex = ValueNotifier<int>(
    65,
  ); // Default ~165cm
  final ValueNotifier<int> _selectedFeetIndex = ValueNotifier<int>(
    2,
  ); // Default 5ft (starts at 3ft)
  final ValueNotifier<int> _selectedInchesIndex = ValueNotifier<int>(
    4,
  ); // Default 4in
  final ValueNotifier<int> _selectedWeightIndex = ValueNotifier<int>(
    25,
  ); // Default ~55kg/lbs depending on unit

  // Metric Data
  final List<int> _cmValues = List.generate(
    201,
    (index) => 100 + index,
  ); // 100cm - 300cm
  final List<int> _kgValues = List.generate(
    171,
    (index) => 30 + index,
  ); // 30kg - 200kg

  // Imperial Data
  final List<int> _feetValues = List.generate(
    6,
    (index) => 3 + index,
  ); // 3ft - 8ft
  final List<int> _inchesValues = List.generate(
    12,
    (index) => index,
  ); // 0in - 11in
  final List<int> _lbValues = List.generate(
    351,
    (index) => 60 + index,
  ); // 60lbs - 410lbs

  @override
  void dispose() {
    _isMetric.dispose();
    _selectedCmIndex.dispose();
    _selectedFeetIndex.dispose();
    _selectedInchesIndex.dispose();
    _selectedWeightIndex.dispose();
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
                AppStrings.heightWeight.tr,
                style: context.headlineMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackMainTextColor,
                ),
              ),
              const Gap(32),

              // Unit Toggle
              ValueListenableBuilder<bool>(
                valueListenable: _isMetric,
                builder: (context, isMetric, _) {
                  return Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.bgSecondaryButtonColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _isMetric.value = false;
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: !isMetric
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text(
                                  AppStrings.imperial.tr,
                                  style: context.titleMedium.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: !isMetric
                                        ? AppColors.white
                                        : AppColors.blackMainTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _isMetric.value = true;
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: isMetric
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text(
                                  AppStrings.metric.tr,
                                  style: context.titleMedium.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: isMetric
                                        ? AppColors.white
                                        : AppColors.blackMainTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const Gap(40),

              // Pickers Row
              Expanded(
                child: ValueListenableBuilder<bool>(
                  valueListenable: _isMetric,
                  builder: (context, isMetric, _) {
                    return Row(
                      children: [
                        // Height Picker(s)
                        Expanded(
                          flex: isMetric
                              ? 1
                              : 2, // Give more space for 2 pickers if Imperial
                          child: Column(
                            children: [
                              Text(
                                AppStrings.height.tr,
                                style: context.titleLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blackMainTextColor,
                                ),
                              ),
                              const Gap(20),
                              Expanded(
                                child: isMetric
                                    // Metric: Single CM Picker
                                    ? _buildWheelPicker(
                                        itemCount: _cmValues.length,
                                        onChanged: (index) {
                                          _selectedCmIndex.value = index;
                                        },
                                        itemBuilder: (context, index) {
                                          final text =
                                              '${_cmValues[index]} ${AppStrings.cm.tr}';
                                          return _buildPickerItem(
                                            text,
                                            index,
                                            _selectedCmIndex,
                                          );
                                        },
                                        controller: FixedExtentScrollController(
                                          initialItem: _selectedCmIndex.value,
                                        ),
                                      )
                                    // Imperial: Feet + Inches Pickers
                                    : Row(
                                        children: [
                                          Expanded(
                                            child: _buildWheelPicker(
                                              itemCount: _feetValues.length,
                                              onChanged: (index) {
                                                _selectedFeetIndex.value =
                                                    index;
                                              },
                                              itemBuilder: (context, index) {
                                                final text =
                                                    '${_feetValues[index]} ${AppStrings.ft.tr}';
                                                return _buildPickerItem(
                                                  text,
                                                  index,
                                                  _selectedFeetIndex,
                                                );
                                              },
                                              controller:
                                                  FixedExtentScrollController(
                                                    initialItem:
                                                        _selectedFeetIndex
                                                            .value,
                                                  ),
                                            ),
                                          ),
                                          Expanded(
                                            child: _buildWheelPicker(
                                              itemCount: _inchesValues.length,
                                              onChanged: (index) {
                                                _selectedInchesIndex.value =
                                                    index;
                                              },
                                              itemBuilder: (context, index) {
                                                final text =
                                                    '${_inchesValues[index]} ${AppStrings.cm.tr}';
                                                return _buildPickerItem(
                                                  text,
                                                  index,
                                                  _selectedInchesIndex,
                                                );
                                              },
                                              controller:
                                                  FixedExtentScrollController(
                                                    initialItem:
                                                        _selectedInchesIndex
                                                            .value,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ],
                          ),
                        ),

                        // Weight Picker
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Text(
                                AppStrings.weight.tr,
                                style: context.titleLarge,
                              ),
                              const Gap(20),
                              Expanded(
                                child: _buildWheelPicker(
                                  itemCount: isMetric
                                      ? _kgValues.length
                                      : _lbValues.length,
                                  onChanged: (index) {
                                    _selectedWeightIndex.value = index;
                                  },
                                  itemBuilder: (context, index) {
                                    final text = isMetric
                                        ? '${_kgValues[index]} ${AppStrings.kg.tr}'
                                        : '${_lbValues[index]} ${AppStrings.lb.tr}';
                                    return _buildPickerItem(
                                      text,
                                      index,
                                      _selectedWeightIndex,
                                    );
                                  },
                                  controller: FixedExtentScrollController(
                                    initialItem: _selectedWeightIndex.value,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const Gap(20),

              // Continue Button
              CustomButton(
                text: AppStrings.continueText.tr,
                onTap: () {
                  context.pushNamed(RoutePath.dateOfBirthScreen);
                },
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
                  ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
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
