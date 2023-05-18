import 'package:flutter/material.dart';
import 'package:hello_word_2/model.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.model}) : super(key: key);
  final Model model;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool showView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        child: Image.network(
                          widget.model.image,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        widget.model.name,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                  child: Text(
                    "Description: ${widget.model.description}",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () => setState(() => showView = !showView),
                      child: const Text(
                        "View comment",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: showView,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                    child: Text(
                      "${widget.model.name} : comment 1",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          child: Image.network(
                            widget.model.image,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          "${widget.model.name} : comment 1",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
