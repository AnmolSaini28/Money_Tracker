import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackizer/components/home_report_container.dart';
import 'package:trackizer/components/recent_transaction_list.dart';
import 'package:trackizer/components/user_profile_card.dart';
import 'package:trackizer/constants/colors.dart';
import 'package:trackizer/controller/transaction_controller.dart';
import 'package:trackizer/controller/transaction_details_controller.dart';
import 'package:trackizer/screens/transaction_list.dart';
import 'package:trackizer/widgets/text_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TransactionController transactionController =
    Provider.of<TransactionController>(context);
    TransDetailController transactionDetailController =
    Provider.of<TransDetailController>(context);

    return transactionController.fetching
        ? Center(child: CircularProgressIndicator())
        : Column(
      children: [
        //userData
        UserProfileCard(),
        //balance container
        HomeReportContainer(transactionController: transactionController),
        //recent transactions title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 4,
                child: Text("Recent transactions",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
            Expanded(
              child: CustomTextButton(
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            TransactionList())),
                textStyle: TextStyle(
                    color: selectedTextButton,
                    fontWeight: FontWeight.bold),
                text: 'See All',
              ),
            )
          ],
        ),
        //transaction List View
        RecentTransList(
            transController: transactionController,
            transDetailController: transactionDetailController),
      ],
    );
  }
}