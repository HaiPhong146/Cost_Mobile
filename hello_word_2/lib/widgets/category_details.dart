import 'package:flutter/material.dart';
import 'package:hello_word_2/model/expense_model.dart';

class CategoryDetails extends StatelessWidget {

  final Expense expense;

  const CategoryDetails({Key? key, required this.expense})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 5.0, bottom: 10.0, top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 120.0,
                child: Text(
                  expense.name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                width: 130,
              ),
              Text(
                '-\$${expense.cost.toStringAsFixed(2)}',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[800],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
