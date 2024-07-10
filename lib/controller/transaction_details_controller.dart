import 'package:flutter/material.dart';
import 'package:trackizer/constants/strings.dart';
import 'package:trackizer/services/database_helper.dart';

class TransDetailController with ChangeNotifier {
  DatabaseHelper? databaseHelper = DatabaseHelper.instance;

  TextEditingController titleField = TextEditingController();
  TextEditingController amountField = TextEditingController();
  TextEditingController descriptionField = TextEditingController();

  bool isIncomeSelected = false;
  bool savedTransaction = false;

  String selectedDepartment = others;

  int? transactionId;
  String? date;

  bool buttonSelected = true;

  void changeHomeNdReportSection(bool value) {
    buttonSelected = value;
    notifyListeners();
  }

  void changeCategory() {
    isIncomeSelected = !isIncomeSelected;
    notifyListeners();
  }

  void changeDepartment(String name) {
    selectedDepartment = name;
    notifyListeners();
  }

  String titleIcon() {
    if (selectedDepartment == coffee) return pngPath(coffeePng);
    if (selectedDepartment == lottery) return pngPath(lotteryPng);
    if (selectedDepartment == education) return pngPath(educationPng);
    if (selectedDepartment == fastFood) return pngPath(fastFoodPng);
    if (selectedDepartment == gift) return pngPath(giftPng);
    if (selectedDepartment == gym) return pngPath(gymPng);
    if (selectedDepartment == clothing) return pngPath(clothingPng);
    if (selectedDepartment == health) return pngPath(healthPng);
    if (selectedDepartment == home) return pngPath(homePng);
    if (selectedDepartment == food) return pngPath(foodPng);
    if (selectedDepartment == beauty) return pngPath(beautyPng);
    if (selectedDepartment == recharge) return pngPath(rechargePng);
    if (selectedDepartment == bills) return pngPath(billsPng);
    if (selectedDepartment == movie) return pngPath(moviePng);
    if (selectedDepartment == entertainment) return pngPath(entertainmentPng);
    if (selectedDepartment == petrol) return pngPath(petrolPng);
    if (selectedDepartment == investment) return pngPath(investmentPng);
    if (selectedDepartment == restaurant) return pngPath(restaurantPng);
    if (selectedDepartment == shopping) return pngPath(shoppingPng);
    if (selectedDepartment == snacks) return pngPath(snacksPng);
    if (selectedDepartment == sports) return pngPath(sportsPng);
    if (selectedDepartment == tools) return pngPath(toolsPng);
    if (selectedDepartment == travel) return pngPath(travelPng);
    if (selectedDepartment == groceries) return pngPath(groceriesPng);
    if (selectedDepartment == transport) return pngPath(transportPng);
    if (selectedDepartment == salary) return pngPath(salaryPng);
    if (selectedDepartment == accessories) return pngPath(accessoriesPng);
    return pngPath(othersPng);
  }

  void toTransactionDetail({
    required bool isSaved,
    int? id,
    String? title,
    String? description,
    String? amount,
    bool? isIncome,
    String? department,
    String? dateTime,
  }) {
    savedTransaction = isSaved;
    transactionId = id;
    titleField.text = title ?? "";
    descriptionField.text = description ?? "";
    amountField.text = amount ?? "";
    isIncomeSelected = isIncome ?? false;
    selectedDepartment = department ?? others;
    date = dateTime ?? DateTime.now().toString();
    notifyListeners();
  }
}