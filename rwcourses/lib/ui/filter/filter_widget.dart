import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FilterWidget extends StatelessWidget {
  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;
  final String text;

  const FilterWidget(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Radio(value: value, groupValue: groupValue, onChanged: onChanged),
      Text(text),
    ],);
  }
}
