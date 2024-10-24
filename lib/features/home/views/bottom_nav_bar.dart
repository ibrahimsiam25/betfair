// ignore_for_file: deprecated_member_use

import 'package:betfair/features/home/views/home_view.dart';
import 'package:betfair/features/methods/views/methods_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../fears/views/fears_view.dart';

class BottomNavigationBarController extends StatefulWidget {
  const BottomNavigationBarController({super.key});

  @override
  State<BottomNavigationBarController> createState() =>
      _BottomNavigationBarControllerState();
}

int selectedIndex = 1;

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: selectedIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> buildScreens() {
    return [
    const FearsView(),
      const HomeView(),
      const MethodsView()
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: CustomIcon(
          asset: Assets.imagesIcRoundReportProblem,
          isSelected: selectedIndex == 0,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: CustomIcon(
          asset: Assets.imagesHome,
          isSelected: selectedIndex == 1,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: CustomIcon(
          asset: Assets.imagesMingcuteNewsFill,
          isSelected: selectedIndex == 2,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: buildScreens(),
      items: navBarsItems(),
      backgroundColor: AppColors.lightPrimary,
      decoration: NavBarDecoration(
        colorBehindNavBar: AppColors.primary,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 15,
          ),
        ],
      ),
      navBarHeight: 60.h,
      margin: EdgeInsets.symmetric(horizontal: 80.w, vertical: 16.h),
      padding: const EdgeInsets.all(8),
      navBarStyle: NavBarStyle.simple,
      onItemSelected: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }
}

class CustomIcon extends StatelessWidget {
  final String asset;
  final bool isSelected;

  const CustomIcon({
    super.key,
    required this.asset,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      height: 40.h,
      child: SvgPicture.asset(
        asset,
        color: isSelected ? AppColors.theme : null,
      ),
    );
  }
}
