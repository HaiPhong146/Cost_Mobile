import 'package:flutter/material.dart';
import 'package:hello_word_2/detail.dart';

import 'model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Model> list = [
    const Model(
        name: "Lê Hải Phong",
        description: "Lớp KTPM2020",
        image:
            "https://media.istockphoto.com/id/1322277517/vi/anh/cỏ-dại-trên-núi-lúc-hoàng-hôn.jpg?s=1024x1024&w=is&k=20&c=l_B8ZUjiy0cd7FmnveoWxILGHGcyJ-7JyXf7TCOwfe0="),
    const Model(
        name: "Trần Đình Khôi",
        description: "Lớp KTPM2022",
        image:
            "https://media.istockphoto.com/id/1174472274/vi/anh/kết-nối-với-thiên-nhiên.jpg?s=1024x1024&w=is&k=20&c=DeAfOX0ms0tvY7P8Dux0CjLXyk_51q5cMrNgrefuA-4="),
    const Model(
        name: "Đỗ Thành Đạt",
        description: "Lớp TMĐT2020",
        image:
            "https://media.istockphoto.com/id/1322277517/vi/anh/cỏ-dại-trên-núi-lúc-hoàng-hôn.jpg?s=1024x1024&w=is&k=20&c=l_B8ZUjiy0cd7FmnveoWxILGHGcyJ-7JyXf7TCOwfe0="),
    const Model(
        name: "Kiều Bá DƯơng",
        description: "Lớp HTTT2021.2",
        image:
            "https://media.istockphoto.com/id/1174472274/vi/anh/kết-nối-với-thiên-nhiên.jpg?s=1024x1024&w=is&k=20&c=DeAfOX0ms0tvY7P8Dux0CjLXyk_51q5cMrNgrefuA-4="),
    const Model(
        name: "Lê Phương Tuyết",
        description: "Lớp KHTN2021",
        image:
            "https://media.istockphoto.com/id/1322277517/vi/anh/cỏ-dại-trên-núi-lúc-hoàng-hôn.jpg?s=1024x1024&w=is&k=20&c=l_B8ZUjiy0cd7FmnveoWxILGHGcyJ-7JyXf7TCOwfe0="),
    const Model(
        name: "Trần Ngọc Bảo Uyên",
        description: "Lớp KTPM2020",
        image:
            "https://media.istockphoto.com/id/1174472274/vi/anh/kết-nối-với-thiên-nhiên.jpg?s=1024x1024&w=is&k=20&c=DeAfOX0ms0tvY7P8Dux0CjLXyk_51q5cMrNgrefuA-4="),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bai Tap Flutter"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    hintStyle: const TextStyle(
                        color: Color(0xffACAAA5),
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                    hintText: "Bai tap example"),
              ),
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    list[index].image,
                    width: 200,
                    height: 200,
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 10),
                itemCount: list.length,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                  list.length,
                  (index) => InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(model: list[index]))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                            list[index].image,
                            width: 200,
                            height: 150,
                        fit: BoxFit.cover,
                          ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
