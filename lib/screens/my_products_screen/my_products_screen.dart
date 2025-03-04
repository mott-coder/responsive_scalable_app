import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class MyProductsScreen extends StatefulWidget {
  const MyProductsScreen({super.key});

  @override
  State<MyProductsScreen> createState() => _MyProductsScreenState();
}

class _MyProductsScreenState extends State<MyProductsScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.maxFinite,
        color: appTheme.gray10001,
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsetsDirectional.only(
            start: 20.h,
            top: 15.h,
            end: 20.h,
            bottom: 66.h,
          ),
          child: Column(
            children: [
              Text(
                "My Products".tr,
                style: theme.textTheme.headlineSmall,
              ),
              Divider(
                height: 36.h,
                thickness: 1.h,
              ),
              Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 15.h,
                  ),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: AnimatedBuilder(
                      animation: tabController.animation!,
                      builder: (context, child) {
                        int activeTabIndex =
                            tabController.animation!.value.round();
                        return TabBar(
                          controller: tabController,
                          labelPadding: EdgeInsets.zero,
                          dividerColor: Colors.transparent,
                          labelColor: appTheme.gray10001,
                          labelStyle: TextStyle(
                            fontSize: 16.fSize,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                          ),
                          unselectedLabelColor: theme.colorScheme.primary,
                          unselectedLabelStyle: TextStyle(
                            fontSize: 16.fSize,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                          ),
                          tabs: [
                            Tab(
                              height: 32,
                              child: Container(
                                alignment: Alignment.center,
                                width: double.maxFinite,
                                margin: EdgeInsetsDirectional.only(end: 6.h),
                                decoration: activeTabIndex == 0
                                    ? BoxDecoration(
                                        color: theme.colorScheme.primary,
                                        borderRadius:
                                            BorderRadius.circular(18.h),
                                      )
                                    : BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(18.h),
                                        border: Border.all(
                                          color: theme.colorScheme.primary,
                                          width: 2.h,
                                        ),
                                      ),
                                child: Text("lbl_all".tr),
                              ),
                            ),
                            Tab(
                              height: 32,
                              child: Container(
                                alignment: Alignment.center,
                                width: double.maxFinite,
                                margin: EdgeInsetsDirectional.symmetric(
                                    horizontal: 3.h),
                                decoration: activeTabIndex == 1
                                    ? BoxDecoration(
                                        color: theme.colorScheme.primary,
                                        borderRadius:
                                            BorderRadius.circular(18.h),
                                      )
                                    : BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(18.h),
                                        border: Border.all(
                                          color: theme.colorScheme.primary,
                                          width: 2.h,
                                        ),
                                      ),
                                child: Text("Screen 2".tr),
                              ),
                            ),
                            Tab(
                              height: 32,
                              child: Container(
                                alignment: Alignment.center,
                                width: double.maxFinite,
                                margin: EdgeInsetsDirectional.only(start: 6.h),
                                decoration: activeTabIndex == 2
                                    ? BoxDecoration(
                                        color: theme.colorScheme.primary,
                                        borderRadius:
                                            BorderRadius.circular(18.h),
                                      )
                                    : BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(18.h),
                                        border: Border.all(
                                          color: theme.colorScheme.primary,
                                          width: 2.h,
                                        ),
                                      ),
                                child: Text("Screen 3".tr),
                              ),
                            ),
                          ],
                          indicatorColor: Colors.transparent,
                          onTap: (index) {
                            tabController.index = index;
                            setState(() {});
                          },
                        );
                      },
                    ),
                  )),
              SizedBox(
                height: 15.h,
              ),
              Expanded(
                child: SizedBox(
                  child: Stack(
                    children: [
                      TabBarView(
                        controller: tabController,
                        children: [
                          Text("Screen 1"),
                          Text("Screen 2"),
                          Text("Screen 3"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
