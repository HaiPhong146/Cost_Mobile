import 'package:flutter/material.dart';
import 'package:hello_word_2/model/category_model.dart';
import 'package:hello_word_2/widgets/category_details.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../model/expense_model.dart';
import '../widgets/progress_bar.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;

  const CategoryScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;
    for (Expense expense in widget.category.expenses) {
      totalAmount += expense.cost;
    }
    late double tempCost = widget.category.maxAmount - totalAmount > 0
        ? widget.category.maxAmount - totalAmount
        : 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 200,
                width: double.maxFinite,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0, 2),
                        blurRadius: 6.0),
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: CircularPercentIndicator(
                  center: Text(
                    '\$${tempCost.toStringAsFixed(2)}/\$${widget.category.maxAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  percent: tempCost / widget.category.maxAmount,
                  lineWidth: 13.0,
                  radius: 90,
                  progressColor: Colors.green,
                  animationDuration: 1500,
                  animation: true,
                  backgroundColor: Colors.grey.shade200,
                  animateFromLastPercent: true,
                )),
            ListView.builder(
              itemBuilder: (context,index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0, 2),
                          blurRadius: 6.0),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: CategoryDetails(
                    expense: widget.category.expenses[index],
                  ),
                );
              },
              itemCount: widget.category.expenses.length,
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}

class RadialPainter extends CustomPainter {
  final Color bgColor;
  final Color lineColor;
  final double percent;
  final double width;

  RadialPainter(this.lineColor, this.percent, this.width, this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = bgColor;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
