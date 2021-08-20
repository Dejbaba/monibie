

import 'package:get_it/get_it.dart';
import 'package:monibie/core/viewmodels/app_bar_model.dart';
import 'package:monibie/core/viewmodels/bottom_nav_model.dart';
import 'package:monibie/core/viewmodels/slider_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:monibie/core/viewmodels/bottom_nav_model.dart';


GetIt locator = GetIt.instance;

void setupLocator() {

  /// register models
  locator.registerFactory<BottomNavModel>(() => BottomNavModel());
  locator.registerFactory<AppBarModel>(() => AppBarModel());
  locator.registerFactory<SliderModel>(() => SliderModel());

}

///register multi-providers as a single child widget and pass them to main.dart
final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => BottomNavModel()),
  ChangeNotifierProvider(create: (_) => AppBarModel()),
  ChangeNotifierProvider(create: (_) => SliderModel()),
];
