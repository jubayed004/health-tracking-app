import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset("assets/icons/app_logo_color.svg", height: 40.h),
            Gap(8.w),
          ],
        ),
        Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFF5F5F5),
          ),
          child: const Icon(
            Iconsax.notification,
            color: Color(0xFF6B7FD7),
            size: 24,
          ),
        ),
      ],
    );
  }
}
