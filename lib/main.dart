import 'package:clti/src/pages/test/TestPage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      child: MyApp(),
      supportedLocales: [
        Locale('es', 'ES'),
        Locale('en', 'US'),
      ],
      path: 'resources/langs'));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Scaffold(
                body: Center(child: Image.asset("assets/splash/logo.png"))),
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
