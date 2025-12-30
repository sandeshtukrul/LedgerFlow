import 'dart:ui';
import 'package:business_transactions/config/glass_theme.dart';
import 'package:flutter/material.dart';

class MeshBackground extends StatelessWidget {
  const MeshBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final blob1 = isDark ? GlassColors.blob1Dark : GlassColors.blob1Light;
    final blob2 = isDark ? GlassColors.blob2Dark : GlassColors.blob2Light;
    final blob3 = isDark ? GlassColors.blob3Dark : GlassColors.blob3Light;
    final bg = isDark ? GlassColors.meshBgDark : GlassColors.meshBgLight;

    return Stack(
      children: [
        // 1. Base Color
        Container(color: bg),

        // 2. The Blobs

        // Top Left
        Positioned(
          top: -100,
          left: -100,
          child: _buildGradientBlob(color: blob1, size: 500),
        ),

        // Top Right
        Positioned(
          top: -50,
          right: -150,
          child: _buildGradientBlob(color: blob2, size: 450),
        ),

        // Bottom Left
        Positioned(
          bottom: -100,
          left: -50,
          child: _buildGradientBlob(color: blob3, size: 600),
        ),

        // 3. The Blur (Essential for Glass Effect)
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
          child: Container(color: Colors.transparent),
        ),
      ],
    );
  }

  Widget _buildGradientBlob({required Color color, required double size}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, color.withValues(alpha: 0)],
          stops: const [0.0, 1.0],
        ),
      ),
    );
  }
}
