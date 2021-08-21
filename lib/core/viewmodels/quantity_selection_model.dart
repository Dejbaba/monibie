import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class QuantitySelectionModel extends ChangeNotifier{

  ///quantity counter
  int _quantityCounter = 1;
  int get quantityCounter => _quantityCounter;

  ///number of available quantity
  int _quantity = 40;
  int get quantity => _quantity;

  ///price of product
  double _price = 21000.00;
  double get price => _price;

  ///boolean flag
  bool _disableDecrement = true;
  bool get disableDecrement => _disableDecrement;

  ///boolean flag
  bool _disableIncrement = false;
  bool get disableIncrement => _disableIncrement;

  ///increments quantity
  incrementQuantity(){
    _quantityCounter++;
    _quantity--;
    if(_quantity == 1){
      _disableIncrement = true;
    }
    if(_quantity > 1){
      _disableDecrement = false;
    }
    notifyListeners();
  }

  ///decrements quantity
  decrementQuantity(){
    _quantityCounter--;
    _quantity++;
    if(_quantityCounter == 1){
      _disableDecrement = true;
    }
    if(_quantity > 0){
      _disableIncrement = false;
    }
    notifyListeners();
  }

  ///format currency
  String returnAmount({bool addDecimal = true}) {
    final oCcy = addDecimal ? NumberFormat('#,##0.00', 'en_US') : NumberFormat('#,##0', 'en_US');
    final formattedAmount = oCcy.format((_price * _quantityCounter));
    return formattedAmount;
  }
}