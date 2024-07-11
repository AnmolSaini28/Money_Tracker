import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackizer/components/category_select_header.dart';
import 'package:trackizer/constants/colors.dart';
import 'package:trackizer/constants/strings.dart';
import 'package:trackizer/controller/report_controller.dart';
import 'package:pie_chart/pie_chart.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);
  static ReportController? reportController;

  @override
  Widget build(BuildContext context) {
    reportController = Provider.of<ReportController>(context);

    return Column(
      children: [
        //category selector
        CategorySelectHeader(),

        //pie chart, if not full report
        if (reportController!.reportMethod != fullReport)
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: PieChart(
              dataMap: {
                coffee: chartValue(reportController!.coffeeIncomeAmount,
                    reportController!.coffeeExpenseAmount),
                lottery: chartValue(reportController!.lotteryIncomeAmount,
                    reportController!.lotteryExpenseAmount),
                education: chartValue(reportController!.educationIncomeAmount,
                    reportController!.educationExpenseAmount),
                fastFood: chartValue(reportController!.fastFoodIncomeAmount,
                    reportController!.fastFoodExpenseAmount),
                gift: chartValue(reportController!.giftIncomeAmount,
                    reportController!.giftExpenseAmount),
                gym: chartValue(reportController!.gymIncomeAmount,
                    reportController!.gymExpenseAmount),
                clothing: chartValue(reportController!.clothingIncomeAmount,
                    reportController!.clothingExpenseAmount),
                health: chartValue(reportController!.healthIncomeAmount,
                    reportController!.healthExpenseAmount),
                home: chartValue(reportController!.homeIncomeAmount,
                    reportController!.homeExpenseAmount),
                food: chartValue(reportController!.foodIncomeAmount,
                    reportController!.foodExpenseAmount),
                beauty: chartValue(reportController!.beautyIncomeAmount,
                    reportController!.beautyExpenseAmount),
                recharge: chartValue(reportController!.rechargeIncomeAmount,
                    reportController!.rechargeExpenseAmount),
                bills: chartValue(reportController!.billsIncomeAmount,
                    reportController!.billsExpenseAmount),
                movie: chartValue(reportController!.movieIncomeAmount,
                    reportController!.movieExpenseAmount),
                entertainment: chartValue(reportController!.entertainmentIncomeAmount,
                    reportController!.entertainmentExpenseAmount),
                petrol: chartValue(reportController!.petrolIncomeAmount,
                    reportController!.petrolExpenseAmount),
                investment: chartValue(reportController!.investmentIncomeAmount,
                    reportController!.investmentExpenseAmount),
                restaurant: chartValue(reportController!.restaurantIncomeAmount,
                    reportController!.restaurantExpenseAmount),
                shopping: chartValue(reportController!.shoppingIncomeAmount,
                    reportController!.shoppingExpenseAmount),
                snacks: chartValue(reportController!.snacksIncomeAmount,
                    reportController!.snacksExpenseAmount),
                sports: chartValue(reportController!.sportsIncomeAmount,
                    reportController!.sportsExpenseAmount),
                tools: chartValue(reportController!.toolsIncomeAmount,
                    reportController!.toolsExpenseAmount),
                travel: chartValue(reportController!.travelIncomeAmount,
                    reportController!.travelExpenseAmount),
                groceries: chartValue(reportController!.groceriesIncomeAmount,
                    reportController!.groceriesExpenseAmount),
                transport: chartValue(reportController!.transportIncomeAmount,
                    reportController!.transportExpenseAmount),
                salary: chartValue(reportController!.salaryIncomeAmount,
                    reportController!.salaryExpenseAmount),
                accessories: chartValue(reportController!.accessoriesIncomeAmount,
                    reportController!.accessoriesExpenseAmount),
                others: chartValue(reportController!.othersIncomeAmount,
                    reportController!.othersExpenseAmount),
              },
              animationDuration: Duration(seconds: 1),
              ringStrokeWidth: 40,
              chartType: ChartType.ring,
              legendOptions: LegendOptions(showLegends: true),
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: true,
              ),
            ),
          ),

        //balance container, if full report
        if (reportController!.reportMethod == fullReport)
          Container(
            decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.85),
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            padding: EdgeInsets.all(10.0),
            width: double.infinity,
            child: Column(
              children: [
                Text("Balance: ${reportController!.total.toStringAsFixed(1)}",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: whiteColor)),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                          "Income:\n${reportController!.totalIncome.toStringAsFixed(1)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0, color: whiteColor)),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                          "Expense:\n${reportController!.totalExpense.toStringAsFixed(1)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0, color: whiteColor)),
                    ),
                  ],
                ),
              ],
            ),
          ),

        //category list
        Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              tile(
                title: "Coffee",
                pngName: coffeePng,
                incomeAmount: reportController!.coffeeIncomeAmount,
                expenseAmount: reportController!.coffeeExpenseAmount,
              ),
              tile(
                title: "Lottery",
                pngName: lotteryPng,
                incomeAmount: reportController!.lotteryIncomeAmount,
                expenseAmount: reportController!.lotteryExpenseAmount,
              ),
              tile(
                title: "Education",
                pngName: educationPng,
                incomeAmount: reportController!.educationIncomeAmount,
                expenseAmount: reportController!.educationExpenseAmount,
              ),
              tile(
                title: "Fast-Food",
                pngName: fastFoodPng,
                incomeAmount: reportController!.fastFoodIncomeAmount,
                expenseAmount: reportController!.fastFoodExpenseAmount,
              ),
              tile(
                title: "Gift-Box",
                pngName: giftPng,
                incomeAmount: reportController!.giftIncomeAmount,
                expenseAmount: reportController!.giftExpenseAmount,
              ),
              tile(
                title: "gym",
                pngName: gymPng,
                incomeAmount: reportController!.gymIncomeAmount,
                expenseAmount: reportController!.gymExpenseAmount,
              ),
              tile(
                title: "Clothing",
                pngName: clothingPng,
                incomeAmount: reportController!.clothingIncomeAmount,
                expenseAmount: reportController!.clothingExpenseAmount,
              ),
              tile(
                title: "Health",
                pngName: healthPng,
                incomeAmount: reportController!.healthIncomeAmount,
                expenseAmount: reportController!.healthExpenseAmount,
              ),
              tile(
                title: "Home",
                pngName: homePng,
                incomeAmount: reportController!.homeIncomeAmount,
                expenseAmount: reportController!.homeExpenseAmount,
              ),
              tile(
                title: "Food",
                pngName: foodPng,
                incomeAmount: reportController!.foodIncomeAmount,
                expenseAmount: reportController!.foodExpenseAmount,
              ),
              tile(
                title: "Beauty",
                pngName: beautyPng,
                incomeAmount: reportController!.beautyIncomeAmount,
                expenseAmount: reportController!.beautyExpenseAmount,
              ),
              tile(
                title: "Recharge",
                pngName: rechargePng,
                incomeAmount: reportController!.rechargeIncomeAmount,
                expenseAmount: reportController!.rechargeExpenseAmount,
              ),
              tile(
                title: "Bills",
                pngName: billsPng,
                incomeAmount: reportController!.billsIncomeAmount,
                expenseAmount: reportController!.billsExpenseAmount,
              ),
              tile(
                title: "Movie",
                pngName: moviePng,
                incomeAmount: reportController!.movieIncomeAmount,
                expenseAmount: reportController!.movieExpenseAmount,
              ),
              tile(
                title: "Entertainment",
                pngName: entertainmentPng,
                incomeAmount: reportController!.entertainmentIncomeAmount,
                expenseAmount: reportController!.entertainmentExpenseAmount,
              ),
              tile(
                title: "Petrol",
                pngName: petrolPng,
                incomeAmount: reportController!.petrolIncomeAmount,
                expenseAmount: reportController!.petrolExpenseAmount,
              ),
              tile(
                title: "Investment",
                pngName: investmentPng,
                incomeAmount: reportController!.investmentIncomeAmount,
                expenseAmount: reportController!.investmentExpenseAmount,
              ),
              tile(
                title: "Restaurant",
                pngName: restaurantPng,
                incomeAmount: reportController!.restaurantIncomeAmount,
                expenseAmount: reportController!.restaurantExpenseAmount,
              ),
              tile(
                title: "Shopping",
                pngName: shoppingPng,
                incomeAmount: reportController!.shoppingIncomeAmount,
                expenseAmount: reportController!.shoppingExpenseAmount,
              ),
              tile(
                title: "Snacks",
                pngName: snacksPng,
                incomeAmount: reportController!.snacksIncomeAmount,
                expenseAmount: reportController!.snacksExpenseAmount,
              ),
              tile(
                title: "Sports",
                pngName: sportsPng,
                incomeAmount: reportController!.sportsIncomeAmount,
                expenseAmount: reportController!.sportsExpenseAmount,
              ),
              tile(
                title: "Tools",
                pngName: toolsPng,
                incomeAmount: reportController!.toolsIncomeAmount,
                expenseAmount: reportController!.toolsExpenseAmount,
              ),
              tile(
                title: "Travel",
                pngName: travelPng,
                incomeAmount: reportController!.travelIncomeAmount,
                expenseAmount: reportController!.travelExpenseAmount,
              ),
              tile(
                title: "Groceries",
                pngName: groceriesPng,
                incomeAmount: reportController!.groceriesIncomeAmount,
                expenseAmount: reportController!.groceriesExpenseAmount,
              ),
              tile(
                title: "Transport",
                pngName: transportPng,
                incomeAmount: reportController!.transportIncomeAmount,
                expenseAmount: reportController!.transportExpenseAmount,
              ),
              tile(
                title: "Salary",
                pngName: salaryPng,
                incomeAmount: reportController!.salaryIncomeAmount,
                expenseAmount: reportController!.salaryExpenseAmount,
              ),
              tile(
                title: "Accessories",
                pngName: accessoriesPng,
                incomeAmount: reportController!.accessoriesIncomeAmount,
                expenseAmount: reportController!.accessoriesExpenseAmount,
              ),
              tile(
                title: "Others",
                pngName : othersPng,
                incomeAmount: reportController!.othersIncomeAmount,
                expenseAmount: reportController!.othersExpenseAmount,
              ),
            ],
          ),
        ),
      ],
    );
  }

  ListTile tile({
    required String title,
    required String pngName,
    required double incomeAmount,
    required double expenseAmount,
  }) {
    double percentage = 0;
    String trailingAmount = "0.0";
    if (reportController!.reportMethod == income) {
      percentage = incomeAmount / reportController!.totalIncome * 100;
      if (incomeAmount != 0)
        trailingAmount = "+${incomeAmount.toStringAsFixed(1)}";
    }

    if (reportController!.reportMethod == expense) {
      percentage = expenseAmount / reportController!.totalExpense * 100;
      if (expenseAmount != 0)
        trailingAmount = "-${expenseAmount.toStringAsFixed(1)}";
    }

    if (reportController!.reportMethod == fullReport) {
      trailingAmount = (incomeAmount - expenseAmount).toStringAsFixed(1);
    }

    return ListTile(
      title: Text(title),
      contentPadding: EdgeInsets.all(10.0),
      leading: Container(
        height: 50.0,
        width: 50.0,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: whiteColor,
            boxShadow: [BoxShadow(color: blackColor)],
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Image.asset(
          pngPath(pngName),
          height: 35.0,
          color: svgColor,
        ),
      ),
      subtitle: reportController!.reportMethod == fullReport
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$income: ${incomeAmount.toStringAsFixed(1)}",
              style: TextStyle(color: incomeGreen)),
          Text("$expense: ${expenseAmount.toStringAsFixed(1)}",
              style: TextStyle(color: expenseRed)),
        ],
      )
          : Text(
          "Percentage : ${percentage > 0 ? percentage.toStringAsFixed(1) : 0}%"),
      trailing: Text(trailingAmount,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: reportController!.reportMethod == income
                  ? incomeGreen
                  : reportController!.reportMethod == expense
                  ? expenseRed
                  : blackColor)),
    );
  }

  double chartValue(double incomeAmount, double expenseAmount) {
    if (reportController!.reportMethod == income) return incomeAmount;
    if (reportController!.reportMethod == expense) return expenseAmount;
    return incomeAmount - expenseAmount;
  }
}