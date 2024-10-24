import 'package:flutter/material.dart';

class MealTraits extends StatelessWidget {
  const MealTraits({super.key, required this.icun, required this.dayta});
  final IconData icun;
  final String dayta;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icun),
        SizedBox(
          width: 6,
        ),
        Text(
          dayta,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            // fontSize: 20,
          ),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
