import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  const PageTemplate({
    Key? key,
    required this.title,
    required this.content,
    required this.bottom,
  }) : super(key: key);

  final Widget title;
  final Widget content;
  final Widget bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Stack(alignment: Alignment.center, children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 20,
                ),
                child: title,
              ),
              content,
            ]),
          ),
          //manual position using left, top, right, bottom
          Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: bottom,
              )),
        ]));
  }
}
