import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedCircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const ElevatedCircleIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64.r,
      height: 64.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2, offset: Offset(0, 4))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(64.r),
          child: Center(child: Icon(icon, size: 28, color: Colors.black87)),
        ),
      ),
    );
  }
}
