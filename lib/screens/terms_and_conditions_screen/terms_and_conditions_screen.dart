import 'package:flutter/material.dart';
import 'package:responsive_scalable_app/core/app_export.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                // height: 32.h,
                width: double.maxFinite,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "lbl_terms_of_use".tr,
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkResponse(
                        onTapUp: (details) {
                          NavigatorService.goBack();
                        },
                        child: SizedBox(
                          height: 32.h,
                          width: 32.h,
                          child: Center(
                            child: Icon(
                              Icons.arrow_back,
                              size: 28.h,
                            ),
                          ),
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
              Text("Terms And Conditions Screen")
            ],
          ),
        ),
      )),
    );
  }
}
