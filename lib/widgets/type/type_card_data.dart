import 'package:flutter/material.dart';

class TypeCardData extends StatelessWidget {
  final String type;

  const TypeCardData({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min,
      children: [
        Text(type, style: const TextStyle(
            color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w600
        ),),
      ],
    );
  }


}

