import 'package:flutter/material.dart';
import '../../core/app_export.dart';

import 'provider/favorites_provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: const FavoritesScreen(),
    );
  }
}

class _FavoritesScreenState extends State<FavoritesScreen> {
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
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "msg_favourites".tr,
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 36.h,
              thickness: 1.h,
            ),
            Text("Favorites Screen")
          ],
        ),
      ),
    ));
  }
}
