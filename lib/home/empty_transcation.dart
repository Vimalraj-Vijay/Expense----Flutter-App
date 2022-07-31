import 'package:flutter/material.dart';

class EmptyTranscation extends StatelessWidget {
  const EmptyTranscation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          const Text(
            'No Data Found!',
            style: TextStyle(
              fontFamily: 'QuickSands',
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            height: constraints.maxHeight * .7,
            child: Image.asset(
              'assests/images/waiting.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      );
    });
  }
}
