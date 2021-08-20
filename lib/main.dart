import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monibie/core/constants/app_constants.dart';
import 'package:monibie/locator.dart';
import 'package:monibie/ui/views/pages/bottom_nav.dart';
import 'package:provider/provider.dart';

void main() {
  ///locks the app to portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  ///registers view-models
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: ()=>  MultiProvider(
        providers: allProviders,
        child: MaterialApp(
          title: 'Monibie',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: Theme.of(context)
                .appBarTheme
                .copyWith(brightness: Brightness.dark),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: BottomNav(),
        ),

      ),
        designSize: Size(logicalWidth(), logicalHeight())
    );
  }
}

