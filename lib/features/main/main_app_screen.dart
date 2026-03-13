import '../../core/constants/app_images.dart';
import '../../core/styles/colors.dart';
import '../../core/widgets/custom_svg_picture.dart';
import '../home/pages/home_screen.dart';

import 'package:flutter/material.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    Center(child: Text('WishList')),
    Center(child: Text('cart')),
    Center(child: Text('Profile')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: _bottomNavBar(),
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.homeSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.homeSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.bookmarkSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.bookmarkSvg,
            color: AppColors.primaryColor,
          ),
          label: 'WishList',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.cartSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.cartSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.profileSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.profileSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
