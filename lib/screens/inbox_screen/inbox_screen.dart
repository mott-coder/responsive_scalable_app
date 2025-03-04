import 'package:flutter/material.dart';

import '../../core/app_export.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  void initState() {
    super.initState();
    loadMessages();
  }

  void loadMessages() async {}

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
                        "msg_messages".tr,
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.h,
              height: 36.h,
            ),
            Text("Messages Screen")
          ],
        ),
      ),
    ));
  }
}
