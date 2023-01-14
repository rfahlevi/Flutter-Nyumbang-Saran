// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  VoidCallback onTap;
  // String label;
  Widget label;
  Color backgroundColor;
  FilledButton({
    super.key,
    required this.onTap,
    // required this.label,
    required this.label,
    required this.backgroundColor,
  });

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: label,
          ),
        ));
  }
}
