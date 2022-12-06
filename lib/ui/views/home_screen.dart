import 'package:flutter/material.dart';
import 'package:search_assessment/core/core.dart';
import 'package:search_assessment/ui/widget/widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                color: AppTheme.appBlack,
                child: SearchBarWidget(
                  bodyMargin: MediaQuery.of(context).size.width * 0.07,
                )),
            Container(
              margin: const EdgeInsets.only(top: 70),
            )
          ],
        ),
      ),
    );
  }
}
