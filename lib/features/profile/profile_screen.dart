import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:health_tracker_app/core/router/routes.dart';
import 'package:health_tracker_app/share/widgets/button/circular_arrow_button.dart';
import 'package:health_tracker_app/utils/color/app_colors.dart';
import 'package:health_tracker_app/utils/extension/base_extension.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      CircularArrowButton(onTap: () => AppRouter.route.pop()),
                      Expanded(
                        child: Text(
                          "Profile",
                          textAlign: TextAlign.center,
                          style: context.titleLarge.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackMainTextColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 40), // Balance the back button
                    ],
                  ),
                ),
                const Gap(20),

                // Profile Card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        // Profile Image with Edit Button
                        Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  'https://i.pravatar.cc/150?img=47',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.white,
                                      child: const Icon(
                                        Icons.person,
                                        size: 40,
                                        color: AppColors.primaryColor,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(12),

                        // Name and Email
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "Iris Rodriguez",
                                    style: context.titleMedium.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Gap(4),
                                  Text(
                                    "irisrodriguez@mail.com",
                                    style: context.bodyMedium.copyWith(
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Edit Button
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Edit",
                                style: context.labelLarge.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(24),

                // Menu Items
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      _buildMenuItem(
                        icon: Icons.settings_outlined,
                        title: "Account Settings",
                        onTap: () {
                          // Navigate to account settings
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.support_agent_outlined,
                        title: "Contact & Support",
                        onTap: () {
                          // Navigate to support
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.description_outlined,
                        title: "Terms & Condition",
                        onTap: () {
                          // Navigate to terms
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.privacy_tip_outlined,
                        title: "Privacy & Policy",
                        onTap: () {
                          // Navigate to privacy policy
                        },
                      ),
                      const Gap(12),
                      _buildMenuItem(
                        icon: Icons.logout,
                        title: "Logout",
                        iconColor: AppColors.error,
                        showArrow: false,
                        onTap: () {
                          // Show logout confirmation
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
    bool showArrow = true,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? AppColors.primaryColor, size: 24),
            const Gap(12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackMainTextColor,
                ),
              ),
            ),
            if (showArrow)
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.grayTextSecondaryColor,
              ),
          ],
        ),
      ),
    );
  }
}
