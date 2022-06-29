import 'package:flutter/material.dart';
import 'package:hello_word_2/data/data.dart';
import 'package:hello_word_2/screen/category_screen.dart';
import 'package:hello_word_2/widgets/bar_chart.dart';
import 'package:hello_word_2/widgets/progress_bar.dart';

import '../model/expense_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var exp = RandomNumber();
  int count = 0;
  late Widget Function(int index) buidWidget = _customWidget;

  callback(){
    setState(() {
      exp = RandomNumber();
      buidWidget = _customWidget;
    });
  }

  Widget _customWidget(int index) {
    double sum = 0;
    for (Expense expense in exp.categories[index - 1].expenses) {
      sum += expense.cost;
    }
    print(sum);
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: 10.0, horizontal: 20.0),
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
      child: ProgressBar(
        category: exp.categories[index - 1],
        totalAmount: sum,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            forceElevated: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text('Simple Budget',
                  style: TextStyle(color: Colors.white70)),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://i.pinimg.com/originals/6d/67/43/6d6743d3d6edbde45a58d13d2b886cb3.jpg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.brown, Colors.transparent])),
                  )
                ],
              ),
            ),
            leading: IconButton(
              iconSize: 30.0,
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                iconSize: 30.0,
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              if (index == 0) {
                return Container(
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
                  child: BarChart(expenses: exp.weeklySpending, callbackfunction: callback,),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CategoryScreen(
                                category: exp.categories[index - 1])));
                  },
                  child: buidWidget(index)
                );
              }
            }, childCount: exp.categories.length + 1),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Color(0xff000f26),
                      fontSize: 30,
                    ),
                    children: [
                      TextSpan(text: 'Made with ❤ ❤ by '),
                      TextSpan(
                        text: 'Phong ',
                        style: TextStyle(
                          color: Color(0xFF158443),
                        ),
                      ),
                    ],
                  ),
                  textScaleFactor: 0.5,
                ),
                const SizedBox(
                  height: 50.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
