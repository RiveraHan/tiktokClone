import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/text_format.dart';

import '../../infrastructure/models/video_load_model.dart';

class VideoButtons extends StatelessWidget {
  final Video video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _CustomIconBottom(
            value: 1, iconData: Icons.favorite, iconColor: Colors.red),
        const SizedBox(height: 10),
        const _CustomIconBottom(
            value: 1, iconData: Icons.remove_red_eye_outlined),
        const SizedBox(height: 10),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconBottom(
              value: 0, iconData: Icons.play_circle_fill_outlined),
        )
      ],
    );
  }
}

class _CustomIconBottom extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconBottom(
      {required this.value, required this.iconData, iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              color: color,
              size: 30,
            )),
        if (value > 0) Text(TextFormats.humanReadableNumber(value))
      ],
    );
  }
}
