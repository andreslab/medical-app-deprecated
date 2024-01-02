import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:heart/theme/app_theme.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightFilter = size.height * 0.07;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              width: double.infinity,
              height: heightFilter,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (_, int index) => _FilterItem())),
          Container(
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, int index) => _ItemNews(),
              itemCount: 100,
            ),
          )
        ],
      ),
    );
  }
}

class _FilterItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        decoration: BoxDecoration(
            color: AppTheme.backgroundRecord,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Center(child: Text("Categoria")),
      ),
    );
  }
}

class _ItemNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height * 0.2;

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: AppTheme.backgroundRecord),
        width: double.infinity,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Titulo',
              style: TextStyle(fontSize: AppTheme.title, color: AppTheme.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
              style: TextStyle(fontSize: AppTheme.body, color: AppTheme.normal),
            )
          ],
        ));
  }
}
