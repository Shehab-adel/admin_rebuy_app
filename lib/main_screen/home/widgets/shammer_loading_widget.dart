import 'package:admin_rebuy_app/main_screen/home/widgets/category_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});
  final _shimmerGradient = const LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );
  @override
  Widget build(BuildContext context) {
    return Shimmer(
        enabled: false,
        period: const Duration(seconds: 30),
        gradient: _shimmerGradient,
        child: Container(
            height: 200,
            color: Colors.grey[300],
            child: const CategoryDetailsWidget()));
  }
}
