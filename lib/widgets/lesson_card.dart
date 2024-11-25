import 'package:flutter/material.dart';
import 'package:schedule_management/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule_management/models/Lesson.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  Color? bgColor;
  final bool hasShape;

  LessonCard(
      {super.key, required this.lesson, this.hasShape = false, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 137,
      decoration: BoxDecoration(
        color: bgColor ?? Constants.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          if (hasShape)
            Positioned(
                right: 0,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(10)),
                  child: SvgPicture.asset("assets/images/custom-shape-2.svg",
                      color: Constants.darkGreenColor),
                )),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      lesson.subject,
                      style: Constants.lessonTitleTextStyle
                          .copyWith(color: textColor),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/icons/ellipsis-v.svg",
                      color: iconColor,
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  lesson.chapter,
                  style: Constants.lessonSubTitleTextStyle
                      .copyWith(color: textColor),
                ),
                const Spacer(),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/location-point.svg",
                        color: iconColor),
                    const SizedBox(width: 10),
                    Text(
                      lesson.location,
                      style:
                          Constants.detailsTextStyle.copyWith(color: textColor),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        foregroundImage: AssetImage(
                            "assets/images/${lesson.profAvatar}.png"),
                        radius: 7,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      lesson.professor,
                      style:
                          Constants.detailsTextStyle.copyWith(color: textColor),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          )
        ],
      ),
    );
  }

  Color get textColor => bgColor == null ? Colors.black : Colors.white;
  Color get iconColor =>
      bgColor == null ? Constants.disabledIconColor : Colors.white;
}
