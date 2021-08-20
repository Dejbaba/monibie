import 'package:flutter/material.dart';
import 'package:monibie/ui/views/pages/home.dart';


class BottomNavModel extends ChangeNotifier{

  ///current index of the bottom nav-bar
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  // ///controls parent appBar
  // bool _switchColor = true;
  // bool get switchColor => _switchColor;


  ///children of the bottom Nav
  List<Widget>  _children = [
    Home(), ///(tab 1)
    Container(), ///empty view(tab 2)
    Container() ///empty view(tab 3)
  ];

  List<Widget> get children => _children;


  ///updates the current index of the bottom nav
  updateIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }
  //
  // ///updates the color of the parent appbar
  // updateParentColor({bool value}){
  //   _switchColor = value;
  //   notifyListeners();
  // }



}