import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:math';

import 'package:warframe_quick/constants/colors.dart';
import 'package:warframe_quick/constants/services.dart';
import 'package:warframe_quick/helpers/error_widget.dart';
import 'package:warframe_quick/providers/auth_provider.dart';
import 'package:warframe_quick/services/user/auth_services.dart';

class ShrinkingProgress extends StatefulWidget {
  const ShrinkingProgress({super.key});

  @override
  State<ShrinkingProgress> createState() => _ShrinkingProgressState();
}

class _ShrinkingProgressState extends State<ShrinkingProgress> {
  final AuthProvider _controller = Get.find();

  Timer? timer;

  @override
  void initState() {
    super.initState();
    startShrinking();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startShrinking() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_controller.progress.value > 0) {
          _controller.progress.value -= (100 / ServicesConst.confirmedTime);
        } else {
          timer.cancel();
        }
        if (_controller.timeCount.value > 0) _controller.timeCount.value -= 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => _controller.progress.value > 1
            ? Column(
                children: [
                  const SizedBox(height: 30),
                  CustomPaint(
                    painter:
                        ProgressPainter(progress: _controller.progress.value),
                    child: SizedBox(
                      width: 64,
                      height: 64,
                      child: Center(
                        child: Text(
                          '${_controller.timeCount.value}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: InkWell(
                    onTap: () async {
                      var result = await AuthServices().reCode();
                      if (result[0]) {
                        _controller.progress.value = 100.0;
                        _controller.timeCount.value =
                            ServicesConst.confirmedTime;
                        startShrinking();
                        infoSnack(easy.tr('ApiMess29'));
                      } else {
                        if (context.mounted) {
                          infoSnack(easy.tr(result[1].toString()));
                        }
                      }
                    },
                    child: Text(
                      easy.tr('confirmText3'),
                      style: TextStyle(
                        color: ColorsConst.primarySecond,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    const startAngle = -pi / 2;
    final sweepAngle = 2 * pi * (progress / 100);

    final backgroundPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final progressPaint = Paint()
      ..color = const Color(0xffF12711)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawCircle(center, radius, backgroundPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(ProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
