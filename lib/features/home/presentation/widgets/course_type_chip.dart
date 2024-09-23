import 'package:flutter/material.dart';

class CourseTypeChip extends StatelessWidget {
  final bool selected;
  final VoidCallback? onTap;

  const CourseTypeChip({
    super.key,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: const Border.fromBorderSide(BorderSide(
            color: Colors.blue,
          )),
          borderRadius: BorderRadius.circular(8),
          color: selected ? Colors.blue : Colors.transparent,
        ),
        padding: const EdgeInsets.all(8),
        child: Text(
          "Bitcoin",
          style: TextStyle(
            color: selected ? Colors.white : Colors.blue,
          ),
        ),
      ),
    );
  }
}
