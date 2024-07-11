import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackizer/constants/colors.dart';
import 'package:trackizer/constants/strings.dart';
import 'package:trackizer/controller/report_controller.dart';
import 'package:trackizer/controller/transaction_controller.dart';
import 'package:trackizer/controller/transaction_details_controller.dart';
import 'package:trackizer/models/transaction_model.dart';
import 'package:trackizer/widgets/snackbar.dart';

class TransactionDetail extends StatelessWidget {
  TransactionDetail({Key? key}) : super(key: key);
  static TransDetailController? transDetailController;
  static TransactionController? transController;
  static ReportController? reportController;

  @override
  Widget build(BuildContext context) {
    transDetailController = Provider.of<TransDetailController>(context);
    transController = Provider.of<TransactionController>(context);
    reportController = Provider.of<ReportController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0.0,
        leadingWidth: 25.0,
        title: Row(
          children: [
            Text(
              transDetailController!.isIncomeSelected ? income : expense,
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            IconButton(
                icon: Icon(Icons.refresh_outlined),
                tooltip: "Change Category",
                onPressed: () => transDetailController!.changeCategory())
          ],
        ),
        actions: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: TextButton(
                    onPressed: () => save(context),
                    child: Text(
                        transDetailController!.savedTransaction
                            ? "Update"
                            : "Save",
                        style: TextStyle(color: whiteColor))),
              ),
            ],
          )
        ],
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: Column(
        children: [
          GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 1.4),
            children: [
              categoryIcons(
                  text: coffee,
                  pngName: coffeePng,
                  isSelected:
                  transDetailController!.selectedDepartment == coffee
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(coffee)),
              categoryIcons(
                  text: lottery,
                  pngName: lotteryPng,
                  isSelected:
                  transDetailController!.selectedDepartment == lottery
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(lottery)),
              categoryIcons(
                  text: education,
                  pngName: educationPng,
                  isSelected:
                  transDetailController!.selectedDepartment == education
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(education)),
              categoryIcons(
                  text: fastFood,
                  pngName: fastFoodPng,
                  isSelected: transDetailController!.selectedDepartment == fastFood
                      ? true
                      : false,
                  onPress: () => transDetailController!.changeDepartment(fastFood)),
              categoryIcons(
                  text: gift,
                  pngName: giftPng,
                  isSelected:
                  transDetailController!.selectedDepartment == gift
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(gift)),
              categoryIcons(
                  text: gym,
                  pngName: gymPng,
                  isSelected: transDetailController!.selectedDepartment == gym
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(gym)),
              categoryIcons(
                  text: clothing,
                  pngName: clothingPng,
                  isSelected:
                  transDetailController!.selectedDepartment == clothing
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(clothing)),
              categoryIcons(
                  text: health,
                  pngName: healthPng,
                  isSelected:
                  transDetailController!.selectedDepartment == health
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(health)),
              categoryIcons(
                  text: home,
                  pngName: homePng,
                  isSelected:
                  transDetailController!.selectedDepartment == home
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(home)),
              categoryIcons(
                  text: food,
                  pngName: foodPng,
                  isSelected:
                  transDetailController!.selectedDepartment == food
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(food)),
              categoryIcons(
                  text: beauty,
                  pngName: beautyPng,
                  isSelected:
                  transDetailController!.selectedDepartment == beauty
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(beauty)),
              categoryIcons(
                  text: recharge,
                  pngName: rechargePng,
                  isSelected:
                  transDetailController!.selectedDepartment == recharge
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(recharge)),
              categoryIcons(
                  text: bills,
                  pngName: billsPng,
                  isSelected:
                  transDetailController!.selectedDepartment == bills
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(bills)),
              categoryIcons(
                  text: movie,
                  pngName: moviePng,
                  isSelected:
                  transDetailController!.selectedDepartment == movie
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(movie)),
              categoryIcons(
                  text: entertainment,
                  pngName: entertainmentPng,
                  isSelected:
                  transDetailController!.selectedDepartment == entertainment
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(entertainment)),
              categoryIcons(
                  text: petrol,
                  pngName: petrolPng,
                  isSelected:
                  transDetailController!.selectedDepartment == petrol
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(petrol)),
              categoryIcons(
                  text: investment,
                  pngName: investmentPng,
                  isSelected:
                  transDetailController!.selectedDepartment == investment
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(investment)),
              categoryIcons(
                  text: restaurant,
                  pngName: restaurantPng,
                  isSelected:
                  transDetailController!.selectedDepartment == restaurant
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(restaurant)),
              categoryIcons(
                  text: shopping,
                  pngName: shoppingPng,
                  isSelected:
                  transDetailController!.selectedDepartment == shopping
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(shopping)),
              categoryIcons(
                  text: snacks,
                  pngName: snacksPng,
                  isSelected:
                  transDetailController!.selectedDepartment == snacks
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(snacks)),
              categoryIcons(
                  text: sports,
                  pngName: sportsPng,
                  isSelected:
                  transDetailController!.selectedDepartment == sports
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(sports)),
              categoryIcons(
                  text: tools,
                  pngName: toolsPng,
                  isSelected:
                  transDetailController!.selectedDepartment == tools
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(tools)),
              categoryIcons(
                  text: travel,
                  pngName: travelPng,
                  isSelected:
                  transDetailController!.selectedDepartment == travel
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(travel)),
              categoryIcons(
                  text: groceries,
                  pngName: groceriesPng,
                  isSelected:
                  transDetailController!.selectedDepartment == groceries
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(groceries)),
              categoryIcons(
                  text: transport,
                  pngName: transportPng,
                  isSelected:
                  transDetailController!.selectedDepartment == transport
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(transport)),
              categoryIcons(
                  text: salary,
                  pngName: salaryPng,
                  isSelected:
                  transDetailController!.selectedDepartment == salary
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(salary)),
              categoryIcons(
                  text: accessories,
                  pngName: accessoriesPng,
                  isSelected:
                  transDetailController!.selectedDepartment == accessories
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(accessories)),
              categoryIcons(
                  text: others,
                  pngName: othersPng,
                  isSelected:
                  transDetailController!.selectedDepartment == others
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(others)),
            ],
          ),
          Container(
            color: primaryColor,
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                    flex: 5,
                    child: TextField(
                      controller: transDetailController!.titleField,
                      cursorColor: greyText,
                      style: TextStyle(
                          color: greyText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          hintText: "Title",
                          hintStyle: TextStyle(color: greyText),
                          prefixIcon: Padding(
                            padding:
                            const EdgeInsets.only(right: 15.0, left: 5.0),
                            child: Image.asset(
                              transDetailController!.titleIcon(),
                              height: 5.0,
                              color: whiteColor,
                            ),
                          ),
                          border: InputBorder.none),
                    )),
                Spacer(),
                Expanded(
                    flex: 2,
                    child: TextField(
                      controller: transDetailController!.amountField,
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: true, signed: false),
                      cursorColor: greyText,
                      style: TextStyle(
                          color: greyText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          hintText: "Amount",
                          hintStyle: TextStyle(color: greyText),
                          border: InputBorder.none),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: transDetailController!.descriptionField,
                textAlign: TextAlign.start,
                minLines: 20,
                maxLines: 50,
                decoration: InputDecoration(
                    hintText: "Description here...", border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding categoryIcons({
    required String text,
    required String pngName,
    required bool isSelected,
    required Function() onPress,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onPress,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: isSelected ? Color(0xffeae1f9) : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  pngPath(pngName),
                  height: 35.0,
                  color: svgColor,
                ),
              ),
              Text(
                text,
                style: TextStyle(color: svgColor, fontSize: 16),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  save(BuildContext context) {
    if (transDetailController!.titleField.text.isEmpty) {
      snackBar(context: context, title: "Title Is Mandatory");
    } else if (double.tryParse(transDetailController!.amountField.text) ==
        null ||
        transDetailController!.amountField.text.contains("-")) {
      snackBar(context: context, title: "Enter Valid Amount");
    } else {
      TransactionModel transactionModel = TransactionModel(
        id: transDetailController!.savedTransaction
            ? transDetailController!.transactionId
            : DateTime.now().microsecondsSinceEpoch,
        title: transDetailController!.titleField.text,
        description: transDetailController!.descriptionField.text,
        amount: transDetailController!.amountField.text,
        isIncome: transDetailController!.isIncomeSelected ? 1 : 0,
        category: transDetailController!.selectedDepartment,
        dateTime: transDetailController!.savedTransaction
            ? transDetailController!.date
            : DateTime.now().toString(),
      );

      if (transDetailController!.savedTransaction) {
        transController!.updateTransaction(transactionModel);
      } else {
        transController!.insertTransaction(transactionModel);
      }
      transController!.fetchTransaction();
      reportController!.fetchTransaction();
      Navigator.pop(context);
    }
  }
}