import 'package:flutter/material.dart';

import '../../../view model/responsive.dart';

class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText({
    super.key,
    required this.start,
    required this.end,
  });
  final double start;
  final double end;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Text(
          'I specialize in creating high-performance cross-platform ${Responsive.isMobile(context) ? '\n' : '\n'}mobile apps using Flutter, delivering seamless experiences on ${!Responsive.isMobile(context) ? '\n' : '\n'}both Android and iOS with a focus on user-friendly, ${!Responsive.isMobile(context) ? '\n' : '\n'}feature-rich applications that meet client needs.',
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey, wordSpacing: 2, fontSize: value),
        );
      },
    );
  }
}
