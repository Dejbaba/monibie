import 'package:flutter/cupertino.dart';

class SliderModel extends ChangeNotifier{

  ///index position of the slider on home tab
  int _index = 0;
  int get index => _index;

  ///index position of the slider on the product details screen
  int _imageIndex = 0;
  int get imageIndex => _imageIndex;

  updateIndex({int index}){
    _index = index;
    notifyListeners();
  }

  updateImageIndex({int index}){
    _imageIndex = index;
    notifyListeners();
  }
}