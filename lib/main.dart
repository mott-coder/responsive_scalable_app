import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/app_export.dart';
import 'core/providers/auth_provider.dart';
import 'screens/forgot_password_screen/provider/forgot_password_provider.dart';
import 'screens/home_screen/provider/home_provider.dart';
import 'screens/inbox_screen/provider/inbox_provider.dart';
import 'screens/profile_screen/provider/profile_provider.dart';
import 'screens/register_screen/provider/register_provider.dart';
import 'screens/sign_in_screen/provider/sign_in_provider.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions
  //         .currentPlatform); //firebase_options generated by flutter fire

  // if (!kDebugMode) {
  //   await FirebaseAppCheck.instance.activate(
  //     androidProvider: AndroidProvider.playIntegrity,
  //     // appleProvider: AppleProvider.appAttest,
  //     // webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  //   );
  // } else {
  //   await FirebaseAppCheck.instance.activate(
  //     androidProvider: AndroidProvider.debug,

  //     // appleProvider: AppleProvider.debug,
  //   );
  // }

  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ])
  ]).then((value) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => InboxProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => SignInProvider()),
      ],
      child: const MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
          child: Consumer(builder: (context, provider, child) {
            return MaterialApp(
              title: "Nyumber",
              debugShowCheckedModeBanner: false,
              theme: theme.copyWith(
                  pageTransitionsTheme: const PageTransitionsTheme(builders: {
                // TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              })),
              builder: (context, child) {
                return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(textScaler: const TextScaler.linear(1.0)),
                    child: child!);
              },
              navigatorKey: NavigatorService.navigatorKey,
              localizationsDelegates: const [
                AppLocalizationDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              supportedLocales: const [Locale('en', '')],
              initialRoute: AppRoutes.initialRoute,
              routes: AppRoutes.routes,
            );
          }),
        );
      },
    );
  }
}
