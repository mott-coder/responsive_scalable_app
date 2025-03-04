import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../core/app_export.dart';
import '../favorites_screen/favorites_screen.dart';
import '../home_screen/home_screen.dart';
import '../inbox_screen/inbox_screen.dart';
import '../my_products_screen/my_products_screen.dart';
import '../profile_screen/profile_screen.dart';
import 'provider/main_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      child: const MainScreen(),
    );
  }
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  bool canPopNow = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens() {
      return [
        const HomeScreen(),
        const FavoritesScreen(),
        const MyProductsScreen(),
        const InboxScreen(),
        const ProfileScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_rounded),
          iconSize: 33.h,
          contentPadding: 0,
          activeColorPrimary: theme.colorScheme.primary,
          inactiveColorPrimary: appTheme.gray300,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.favorite_rounded),
          iconSize: 33.h,
          activeColorPrimary: theme.colorScheme.primary,
          inactiveColorPrimary: appTheme.gray300,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.add_box_rounded),
          iconSize: 33.h,
          activeColorPrimary: theme.colorScheme.primary,
          inactiveColorPrimary: appTheme.gray300,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.email_rounded),
          iconSize: 33.h,
          activeColorPrimary: theme.colorScheme.primary,
          inactiveColorPrimary: appTheme.gray300,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.account_circle_rounded),
          iconSize: 33.h,
          activeColorPrimary: theme.colorScheme.primary,
          inactiveColorPrimary: appTheme.gray300,
        ),
      ];
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: buildScreens(),
        items: navBarsItems(),
        handleAndroidBackButtonPress: false, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardAppears: true,
        // popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
        padding: EdgeInsets.only(bottom: 3.h),

        // backgroundColor: theme.colorScheme.primaryContainer,
        isVisible: true,
        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 9),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            duration: Duration(milliseconds: 9),
            screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
          ),
        ),
        confineToSafeArea: false,
        navBarHeight: kBottomNavigationBarHeight,
        navBarStyle:
            NavBarStyle.style12, // Choose the nav bar style with this property
      ),
    );
  }
}
