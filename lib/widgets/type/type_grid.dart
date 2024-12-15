import 'package:flutter/material.dart';
import 'package:lab2/widgets/joke/joke_card.dart';
import 'package:lab2/widgets/type/type_card.dart';

import '../../models/joke_model.dart';

class TypeGrid extends StatefulWidget {
  final List<String> types;
  const TypeGrid({super.key, required this.types});

  @override
  State<TypeGrid> createState() => _TypeGridState();
}

class _TypeGridState extends State<TypeGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(padding: const EdgeInsets.all(30),
        crossAxisCount: 1,
        mainAxisSpacing: 30,
        semanticChildCount: 250,
        childAspectRatio: 200 / 30,
        shrinkWrap: true,
        children: widget.types.map((type) =>
            TypeCard(
              type: type,
            )).toList()
    );
  }
}
