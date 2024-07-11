import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackizer/constants/colors.dart';
import 'package:trackizer/controller/transaction_details_controller.dart';
import 'package:trackizer/screens/home_screen.dart';
import 'package:trackizer/screens/report_screen.dart';
import 'package:trackizer/screens/transaction_detail.dart';
import 'package:trackizer/widgets/text_button.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //read does not rebuild when changes
    //HomeController providerRead = Provider.of<HomeController>(context);
    //write rebuild when changes
    //HomeController providerWatch = Provider.of<HomeController>(context);


    TransDetailController transDetailController =
    Provider.of<TransDetailController>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomTextButton(
                text: "Home",
                textColor: transDetailController.buttonSelected
                    ? selectedTextButton
                    : nonSelectedTextButton,
                splash: false,
                press: () {
                  if (!transDetailController.buttonSelected)
                    transDetailController.changeHomeNdReportSection(true);
                },
              ),
              SizedBox(width: 10.0),
              CustomTextButton(
                text: "Report",
                textColor: transDetailController.buttonSelected
                    ? nonSelectedTextButton
                    : selectedTextButton,
                splash: false,
                press: () {
                  if (transDetailController.buttonSelected)
                    transDetailController.changeHomeNdReportSection(false);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          transDetailController.toTransactionDetail(isSaved: false);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => TransactionDetail()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
          child: transDetailController.buttonSelected ? HomeScreen() : ReportScreen(),
        ),
      ),
    );
  }
}