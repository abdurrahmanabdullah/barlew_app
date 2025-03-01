import 'package:flutter/material.dart';

class IndexProviders extends ChangeNotifier {
  ///////////    PaymentMethodProvider     //////////////
  int selectedPaymentMethodIndex = 5;
  void selectMethodTab(int index) {
    selectedPaymentMethodIndex = index;
    notifyListeners();
  }

  //////////////        Engineer Home Screen   ////////////////////
  int selectedTabBarIndex = 0;
  void selectedTabBar(int index) {
    selectedTabBarIndex = index;
    notifyListeners();
  }
}
