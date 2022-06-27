import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../data/data.dart';

class BarChart extends StatefulWidget {
   final List<double> expenses;

   const BarChart({
    Key? key,
    required this.expenses
  }) : super(key: key);

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {

  final List<String> weekLabel = [
    'Mo',
    'Tu',
    'We',
    'Th',
    'Fr',
    'Sa',
    'Su',
  ];

  DateTime findFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  DateTime now = DateTime.now();
  late String _firstDay =
      DateFormat.yMMMd().format(findFirstDateOfTheWeek(now)).toString();
  late String _lastDay =
      DateFormat.yMMMd().format(findLastDateOfTheWeek(now)).toString();
  late var _listBuildWeekSpendingList = _buildWeekSpendingList();

  List<Widget> _buildWeekSpendingList() {
    double maxList = 0;
    for (double price in widget.expenses) {
      if (price > maxList) {
        maxList = price;
      }
    }
    List<Widget> buildWeekSpendingList = [];
    for (int i = 0; i < widget.expenses.length; i++) {
      buildWeekSpendingList.add(Bar(
        label: weekLabel[i],
        amountSpent: widget.expenses[i],
        mostExpensive: maxList,
      ));
    }
    return buildWeekSpendingList;
  }

  List<Widget> _buildWeekSpendingList1() {
    double maxList = 0;
    var randomNumber = RandomNumber();
    var exp = randomNumber.weeklySpending;
    for (double price in exp) {
      if (price > maxList) {
        maxList = price;
      }
    }
    List<Widget> buildWeekSpendingList = [];
    for (int i = 0; i < exp.length; i++) {
      buildWeekSpendingList.add(Bar(
        label: weekLabel[i],
        amountSpent: exp[i],
        mostExpensive: maxList,
      ));
    }
    return buildWeekSpendingList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Weekly Spending',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.black87,
            letterSpacing: 1.7,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              alignment: Alignment.centerLeft,
                onPressed: () {
                  now = now.subtract(const Duration(days: 7));
                  setState(() {
                    _firstDay = DateFormat.yMMMd()
                        .format(findFirstDateOfTheWeek(now))
                        .toString();
                    _lastDay = DateFormat.yMMMd()
                        .format(findLastDateOfTheWeek(now))
                        .toString();
                    _listBuildWeekSpendingList = _buildWeekSpendingList1();
                  });
                },
                icon: const Icon(Icons.arrow_back)),
            SizedBox(
              width: 235,
              child: Text(
                _firstDay + ' - ' + _lastDay,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
            ),
            IconButton(
              alignment: Alignment.centerRight,
                onPressed: () {
                  now = now.add(const Duration(days: 7));
                  setState(() {
                    _firstDay = DateFormat.yMMMd()
                        .format(findFirstDateOfTheWeek(now))
                        .toString();
                    _lastDay = DateFormat.yMMMd()
                        .format(findLastDateOfTheWeek(now))
                        .toString();
                    _listBuildWeekSpendingList = _buildWeekSpendingList1();
                  });
                },
                icon: const Icon(Icons.arrow_forward)),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _listBuildWeekSpendingList,
        )
      ],
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 150.0;

  const Bar(
      {Key? key, this.amountSpent = 0, this.label = '', this.mostExpensive = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barHeight = (amountSpent / mostExpensive) * _maxBarHeight;
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          Text(
            '\$${amountSpent.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            height: barHeight,
            width: 18,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}