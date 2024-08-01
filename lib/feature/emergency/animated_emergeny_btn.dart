import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class AnimatedEmergenyBtn extends StatefulWidget {
  AnimatedEmergenyBtn(
      {super.key,
      required this.title,
      this.enabled = true,
      this.onDoubleTap,
      this.onTap});
  final String title;
  bool enabled;
  final GestureTapCallback? onDoubleTap;
  final GestureTapCallback? onTap;

  @override
  _InfiniteAnimatedButtonState createState() => _InfiniteAnimatedButtonState();
}

class _InfiniteAnimatedButtonState extends State<AnimatedEmergenyBtn>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller!);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap!();
      },
      onDoubleTap: () {
        if (widget.onDoubleTap != null) {
          widget.onDoubleTap!();
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _animation!,
            builder: (context, child) {
              return CustomPaint(
                painter: CirclePainter(_animation!.value, widget.enabled),
                size: Size(200, 200),
              );
            },
          ),
          Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  widget.enabled ? AppColors.primaryLight : AppColors.whiteGray,
            ),
          ),
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    widget.enabled ? AppColors.primaryMedium : AppColors.gray),
            child: Center(
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double animationValue;
  final bool enabled;

  CirclePainter(this.animationValue, this.enabled);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = (enabled ? AppColors.primaryLight : AppColors.gray)
          .withOpacity(1 - animationValue)
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 1.2) * animationValue;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
