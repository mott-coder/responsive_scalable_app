import 'package:flutter/material.dart';

import '../../core/app_export.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
          child: Container(
        width: double.maxFinite,
        height: SizeUtils.height,

        /// OnBoarding Background Decocoration
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage(
        //         ImageConstant.imageOnboardingBg,
        //       ),
        //       fit: BoxFit.fill),
        // ),
        child: SafeArea(
            child: SizedBox(
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              // Build Header Section
              const Spacer(),
              _buildCallToAction(context),
            ],
          ),
        )),
      )),
    );
  }

  Widget _buildCallToAction(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 20.h,
        vertical: 24.h,
      ),
      decoration: AppDecoration.fillPrimaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              "Discover your dream app today".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.headlineLargeSemiBold,
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          SizedBox(
            width: 358.h,
            child: Text(
              "Tom the Flutter Dev helps find hidden gems, demure apps and make app hunts easier. Sign up today."
                  .tr,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleLarge,
            ),
          ),
          SizedBox(
            height: 76.h,
          ),
          CustomElevatedButton(
            text: "lbl_lets_get_started".tr,
            onPressed: () {
              NavigatorService.popAndPushNamed(AppRoutes.signInScreen);
            },
          ),
          SizedBox(
            height: 32.h,
          )
        ],
      ),
    );
  }
}
