import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trackizer/constants/strings.dart';
import 'package:trackizer/models/transaction_model.dart';
import 'package:trackizer/services/database_helper.dart';

class ReportController with ChangeNotifier {
  DatabaseHelper? databaseHelper = DatabaseHelper.instance;
  ReportController() {
    if (databaseHelper != null) fetchTransaction();
  }

  //default report method is income
  String reportMethod = income;

  List<TransactionModel?> transactionList = [];
  List<TransactionModel?> transactionIncomeList = [];
  List<TransactionModel?> transactionExpenseList = [];

  double total = 0.0;
  double totalIncome = 0.0;
  double totalExpense = 0.0;
  double coffeeIncomeAmount = 0.0;
  double coffeeExpenseAmount = 0.0;
  double lotteryIncomeAmount = 0.0;
  double lotteryExpenseAmount = 0.0;
  double educationIncomeAmount = 0.0;
  double educationExpenseAmount = 0.0;
  double fastFoodIncomeAmount = 0.0;
  double fastFoodExpenseAmount = 0.0;
  double giftIncomeAmount = 0.0;
  double giftExpenseAmount = 0.0;
  double gymIncomeAmount = 0.0;
  double gymExpenseAmount = 0.0;
  double clothingIncomeAmount = 0.0;
  double clothingExpenseAmount = 0.0;
  double healthIncomeAmount = 0.0;
  double healthExpenseAmount = 0.0;
  double homeIncomeAmount = 0.0;
  double homeExpenseAmount = 0.0;
  double foodIncomeAmount = 0.0;
  double foodExpenseAmount = 0.0;
  double beautyIncomeAmount = 0.0;
  double beautyExpenseAmount = 0.0;
  double rechargeIncomeAmount = 0.0;
  double rechargeExpenseAmount = 0.0;
  double billsIncomeAmount = 0.0;
  double billsExpenseAmount = 0.0;
  double movieIncomeAmount = 0.0;
  double movieExpenseAmount = 0.0;
  double entertainmentIncomeAmount = 0.0;
  double entertainmentExpenseAmount = 0.0;
  double petrolIncomeAmount = 0.0;
  double petrolExpenseAmount = 0.0;
  double investmentIncomeAmount = 0.0;
  double investmentExpenseAmount = 0.0;
  double restaurantIncomeAmount = 0.0;
  double restaurantExpenseAmount = 0.0;
  double shoppingIncomeAmount = 0.0;
  double shoppingExpenseAmount = 0.0;
  double snacksIncomeAmount = 0.0;
  double snacksExpenseAmount = 0.0;
  double sportsIncomeAmount = 0.0;
  double sportsExpenseAmount = 0.0;
  double toolsIncomeAmount = 0.0;
  double toolsExpenseAmount = 0.0;
  double travelIncomeAmount = 0.0;
  double travelExpenseAmount = 0.0;
  double groceriesIncomeAmount = 0.0;
  double groceriesExpenseAmount = 0.0;
  double transportIncomeAmount = 0.0;
  double transportExpenseAmount = 0.0;
  double salaryIncomeAmount = 0.0;
  double salaryExpenseAmount = 0.0;
  double accessoriesIncomeAmount = 0.0;
  double accessoriesExpenseAmount = 0.0;
  double othersIncomeAmount = 0.0;
  double othersExpenseAmount = 0.0;

  //select report method is all, income or expense
  void cartButton(String value) {
    reportMethod = value;
    notifyListeners();
  }

  void fetchTransaction(
      {DateTime? customFromDate, DateTime? customToDate}) async {
    DateTime fromDate = customFromDate ?? DateTime.now();
    DateTime toDate = customFromDate ?? DateTime.now();

    transactionList = [];

    String fromDayPattern = 'd';
    String fromMonthPattern = 'M';

    String toDayPattern = 'd';
    String toMonthPattern = 'M';

    //date formatting
    //if date is less than 10, then add 0
    if (fromDate.day < 10) fromDayPattern = '0d';
    if (fromDate.month < 10) fromMonthPattern = '0M';
    if (toDate.day < 10) fromDayPattern = '0d';
    if (toDate.month < 10) fromMonthPattern = '0M';

    //formatted date string
    String fromDateFormat = "y-$fromMonthPattern-$fromDayPattern";
    String toDateFormat = "y-$toMonthPattern-$toDayPattern";

    //get data from database
    final dataList = await databaseHelper!.getDateRangeData(
        transactionTable,
        DateFormat(fromDateFormat).format(fromDate),
        DateFormat(toDateFormat).format(toDate));

    //converting to transactionModel
    transactionList = dataList.map((e) => TransactionModel.fromMap(e)).toList();

    //separating income and expense data
    transactionIncomeList =
        transactionList.where((element) => element!.isIncome == 1).toList();
    transactionExpenseList =
        transactionList.where((element) => element!.isIncome == 0).toList();

    //calculate total amount of income and expense
    totalIncome = transactionIncomeList.fold(
        0,
            (previousValue, element) =>
        previousValue + double.parse(element!.amount ?? "0.0"));

    totalExpense = transactionExpenseList.fold(
        0,
            (previousValue, element) =>
        previousValue + double.parse(element!.amount ?? "0.0"));

    //calculate balance amount
    total = totalIncome - totalExpense;

    //get each category income and expense amount
    coffeeIncomeAmount = amountCalc(transactionIncomeList, coffee);
    coffeeExpenseAmount = amountCalc(transactionExpenseList, coffee);
    lotteryIncomeAmount = amountCalc(transactionIncomeList, lottery);
    lotteryExpenseAmount = amountCalc(transactionExpenseList, lottery);
    educationIncomeAmount = amountCalc(transactionIncomeList, education);
    educationExpenseAmount = amountCalc(transactionExpenseList, education);
    fastFoodIncomeAmount = amountCalc(transactionIncomeList, fastFood);
    fastFoodExpenseAmount = amountCalc(transactionExpenseList, fastFood);
    gymIncomeAmount = amountCalc(transactionIncomeList, gym);
    gymExpenseAmount = amountCalc(transactionExpenseList, gym);
    giftIncomeAmount = amountCalc(transactionIncomeList, gift);
    giftExpenseAmount = amountCalc(transactionExpenseList, gift);
    clothingIncomeAmount = amountCalc(transactionIncomeList, clothing);
    clothingExpenseAmount = amountCalc(transactionExpenseList, clothing);
    healthIncomeAmount = amountCalc(transactionIncomeList, health);
    healthExpenseAmount = amountCalc(transactionExpenseList, health);
    homeIncomeAmount = amountCalc(transactionIncomeList, home);
    homeExpenseAmount = amountCalc(transactionExpenseList, home);
    foodIncomeAmount = amountCalc(transactionIncomeList, food);
    foodExpenseAmount = amountCalc(transactionExpenseList, food);
    beautyIncomeAmount = amountCalc(transactionIncomeList, beauty);
    beautyExpenseAmount = amountCalc(transactionExpenseList, beauty);
    rechargeIncomeAmount = amountCalc(transactionIncomeList, recharge);
    rechargeExpenseAmount = amountCalc(transactionExpenseList, recharge);
    billsIncomeAmount = amountCalc(transactionIncomeList, bills);
    billsExpenseAmount = amountCalc(transactionExpenseList, bills);
    movieIncomeAmount = amountCalc(transactionIncomeList, movie);
    movieExpenseAmount = amountCalc(transactionExpenseList, movie);
    entertainmentIncomeAmount = amountCalc(transactionIncomeList, entertainment);
    entertainmentExpenseAmount = amountCalc(transactionExpenseList, entertainment);
    petrolIncomeAmount = amountCalc(transactionIncomeList, petrol);
    petrolExpenseAmount = amountCalc(transactionExpenseList, petrol);
    investmentIncomeAmount = amountCalc(transactionIncomeList, investment);
    investmentExpenseAmount = amountCalc(transactionExpenseList, investment);
    restaurantIncomeAmount = amountCalc(transactionIncomeList, restaurant);
    restaurantExpenseAmount = amountCalc(transactionExpenseList, restaurant);
    shoppingIncomeAmount = amountCalc(transactionIncomeList, shopping);
    shoppingExpenseAmount = amountCalc(transactionExpenseList, shopping);
    snacksIncomeAmount = amountCalc(transactionIncomeList, snacks);
    snacksExpenseAmount = amountCalc(transactionExpenseList, snacks);
    sportsIncomeAmount = amountCalc(transactionIncomeList, sports);
    sportsExpenseAmount = amountCalc(transactionExpenseList, sports);
    toolsIncomeAmount = amountCalc(transactionIncomeList, tools);
    toolsExpenseAmount = amountCalc(transactionExpenseList, tools);
    travelIncomeAmount = amountCalc(transactionIncomeList, travel);
    travelExpenseAmount = amountCalc(transactionExpenseList, travel);
    groceriesIncomeAmount = amountCalc(transactionIncomeList, groceries);
    groceriesExpenseAmount = amountCalc(transactionExpenseList, groceries);
    transportIncomeAmount = amountCalc(transactionIncomeList, transport);
    transportExpenseAmount = amountCalc(transactionExpenseList, transport);
    salaryIncomeAmount = amountCalc(transactionIncomeList, salary);
    salaryExpenseAmount = amountCalc(transactionExpenseList, salary);
    accessoriesIncomeAmount = amountCalc(transactionIncomeList, accessories);
    accessoriesExpenseAmount = amountCalc(transactionExpenseList, accessories);
    othersIncomeAmount = amountCalc(transactionIncomeList, others);
    othersExpenseAmount = amountCalc(transactionExpenseList, others);

    notifyListeners();
  }

  double amountCalc(
      List<TransactionModel?> transactionIncomeList, String department) =>
      transactionIncomeList
          .where((element) => element!.category == department)
          .fold(
          0,
              (previousValue, element) =>
          previousValue + double.parse(element!.amount ?? "0.0"));
}