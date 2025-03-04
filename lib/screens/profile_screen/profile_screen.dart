import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import 'widgets/logout_modal.dart';
import 'widgets/profile_page_list_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    loadProfileData();
  }

  void loadProfileData() async {}

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
            bottom: 42.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "msg_profile".tr,
                style: theme.textTheme.headlineSmall,
              ),
              Divider(
                height: 36.h,
                thickness: 1.h,
              ),
              _buildProfilePageListWidgets(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePageListWidgets(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkResponse(
              onTapUp: (details) {
                NavigatorService.pushNamed(AppRoutes.privacyPolicyScreen);
              },
              child: ProfilePageListWidget(
                leadingIcon: Icon(Icons.lock_outline_rounded),
                title: "lbl_privacy".tr,
                trailingIcon: Icon(Icons.chevron_right_rounded),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            InkResponse(
              onTapUp: (details) async {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => const LogoutModal());
              },
              child: ProfilePageListWidget(
                leadingIcon: Icon(Icons.logout_outlined),
                title: "lbl_logout".tr,
                style: CustomTextStyles.headlineSmallRegularRed,
                color: appTheme.redA200,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
        ),
      ),
    );
  }
}
