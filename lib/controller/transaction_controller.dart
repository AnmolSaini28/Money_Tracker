import 'package:flutter/material.dart';
import 'package:trackizer/constants/strings.dart';
import 'package:trackizer/models/transaction_model.dart';
import 'package:trackizer/services/database_helper.dart';

class TransactionController with ChangeNotifier {
  DatabaseHelper? databaseHelper = DatabaseHelper.instance;

  List<TransactionModel?> transactionList = [];

  double totalIncome = 0.0;
  double totalExpense = 0.0;
  double total = 0.0;

  bool fetching = false;

  TransactionController() {
    if (databaseHelper != null) fetchTransaction();
  }

  void fetchTransaction() async {
    fetching = true;
    transactionList = [];
    totalIncome = 0.0;
    totalExpense = 0.0;
    total = 0.0;

    final dataList = await databaseHelper!.getData(transactionTable);

    transactionList = dataList.map((e) => TransactionModel.fromMap(e)).toList();

    transactionList.forEach((element) {
      if (element!.isIncome == 1) {
        totalIncome += double.parse(element.amount ?? "0.0");
      } else {
        totalExpense += double.parse(element.amount ?? "0.0");
      }
    });

    total = totalIncome - totalExpense;

    fetching = false;

    notifyListeners();
  }

  void insertTransaction(TransactionModel transactionModel) async =>
      await databaseHelper!
          .insertData(transactionTable, transactionModel.transactionToMap())
          .catchError((onError) => print("Insertion On Error: $onError"));

  void updateTransaction(TransactionModel transactionModel) async =>
      await databaseHelper!
          .updateData(transactionTable, transactionModel.transactionToMap(),
          transactionModel.id ?? 0)
          .catchError((onError) => print("Update On Error: $onError"));

  void deleteTransaction(int id) async => await databaseHelper!
      .deleteData(transactionTable, id)
      .catchError((onError) => print("Deletion On Error: $onError"));

  String tileIcon(String departmentName) {
    if (departmentName == coffee) return pngPath(coffeePng);
    if (departmentName == lottery) return pngPath(lotteryPng);
    if (departmentName == education) return pngPath(educationPng);
    if (departmentName == fastFood) return pngPath(fastFoodPng);
    if (departmentName == gift) return pngPath(giftPng);
    if (departmentName == gym) return pngPath(gymPng);
    if (departmentName == clothing) return pngPath(clothingPng);
    if (departmentName == health) return pngPath(healthPng);
    if (departmentName == home) return pngPath(homePng);
    if (departmentName == food) return pngPath(foodPng);
    if (departmentName == beauty) return pngPath(beautyPng);
    if (departmentName == recharge) return pngPath(rechargePng);
    if (departmentName == bills) return pngPath(billsPng);
    if (departmentName == movie) return pngPath(moviePng);
    if (departmentName == entertainment) return pngPath(entertainmentPng);
    if (departmentName == petrol) return pngPath(petrolPng);
    if (departmentName == investment) return pngPath(investmentPng);
    if (departmentName == restaurant) return pngPath(restaurantPng);
    if (departmentName == shopping) return pngPath(shoppingPng);
    if (departmentName == snacks) return pngPath(snacksPng);
    if (departmentName == sports) return pngPath(sportsPng);
    if (departmentName == tools) return pngPath(toolsPng);
    if (departmentName == travel) return pngPath(travelPng);
    if (departmentName == groceries) return pngPath(groceriesPng);
    if (departmentName == transport) return pngPath(transportPng);
    if (departmentName == salary) return pngPath(salaryPng);
    if (departmentName == accessories) return pngPath(accessoriesPng);
    return pngPath(othersPng);
  }
}