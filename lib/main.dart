import 'package:clti/src/pages/test/TestPage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      child: MyApp(),
      supportedLocales: [
        Locale('es'),
        Locale('en'),
      ],
      fallbackLocale: Locale('en'),
      path: 'resources/langs'));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(Duration(milliseconds: 1500)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.indigo,
                backgroundColor: Colors.indigo,
                visualDensity: VisualDensity.adaptivePlatformDensity),
            home: Container(
              child: Image.asset("assets/splash/logo.png"),
              color: Colors.indigo,
            ),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          );
        } else {
          return MaterialApp(
            title: 'CLTI',
            theme: ThemeData(
                primarySwatch: Colors.indigo,
                visualDensity: VisualDensity.adaptivePlatformDensity),
            home: TestPage(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          );
        }
      },
    );
  }
}
