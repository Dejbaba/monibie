import 'package:flutter/cupertino.dart';

class SliderModel extends ChangeNotifier{

  ///index position of the slider on home tab
  int _index = 0;
  int get index => _index;

  updateIndex({int index}){
    _index = index;
    notifyListeners();
  }
}