import 'package:flutter/cupertino.dart';

class AppBarModel extends ChangeNotifier{

  ///controls parent appBar
  bool _switchColor = true;
  bool get switchColor => _switchColor;

  ///controls product screen appBar
  bool _switchColor2 = true;
  bool get switchColor2 => _switchColor2;

  ///updates the color of the parent appbar
  updateParentColor({bool value}){
    _switchColor = value;
    notifyListeners();
  }

  ///updates the color of the product screen appBar
  updateColor({bool value}){
    _switchColor2 = value;
    notifyListeners();
  }
}