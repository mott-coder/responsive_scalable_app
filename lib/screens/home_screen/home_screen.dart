import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/providers/auth_provider.dart';
import '../profile_screen/provider/profile_provider.dart';
import 'provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loadHomeData();
  }

  Future<void> loadHomeData() async {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    Future.delayed(Duration.zero, () {
      homeProvider.getHomeData();
    });
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
            bottom: 72.h,
          ),
          child: Column(
            children: [
              _buildAppbar(context),
              Divider(
                height: 36.h,
                thickness: 1.h,
              ),
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text("Home"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppbar(BuildContext context) {
    return Consumer2<AuthProvider, ProfileProvider>(
      builder: (context, authProvider, profileProvider, child) {
        return SizedBox(
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authProvider.getGreeting(),
                    style: theme.textTheme.headlineSmall,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
