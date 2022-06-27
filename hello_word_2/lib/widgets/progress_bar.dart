import 'package:flutter/material.dart';
import 'package:hello_word_2/model/category_model.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressBar extends StatefulWidget {

  final Category category;
  final double totalAmount;

  ProgressBar({Key? key, required this.category, this.totalAmount = 0})
      : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  late double tempCost = widget.category.maxAmount - widget.totalAmount > 0 ? widget.category.maxAmount - widget.totalAmount : 0;

  Color creatColor() {
    if (1 - widget.totalAmount / widget.category.maxAmount > 0.5) {
      return Colors.green;
    } else if (1 - widget.totalAmount / widget.category.maxAmount > 0.3) {
      return Colors.orange;
    } else {
      return Colors.redAccent;
    }
  }

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
                  widget.category.name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Text(
                '\$${tempCost.toStringAsFixed(2)}/\$${widget.category.maxAmount.toStringAsFixed(2)}',
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 10.0),
          child: LinearPercentIndicator(
              barRadius: const Radius.circular(20),
              lineHeight: 20,
              percent: tempCost / widget.category.maxAmount,
              animation: true,
              animationDuration: 1500,
              progressColor: creatColor(),
              backgroundColor: Colors.grey.shade200),
        )
      ],
    );
  }
}
