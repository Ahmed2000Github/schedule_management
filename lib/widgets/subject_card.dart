import 'package:flutter/material.dart';
import 'package:schedule_management/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule_management/models/subject.dart';

class SubjectCard extends StatelessWidget {
  final Subject subject;

  const SubjectCard({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cardWidth = (width - 2 * Constants.horizontalPadding - 32) / 2;
    return Container(
      height: 119,
      width: cardWidth,
      decoration: BoxDecoration(
        color: subject.bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
                child: SvgPicture.asset("assets/images/custom-shape-1.svg",
                    color: subject.shapeColor),
              )),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/${subject.logo}.svg"),
                    Spacer(),
                    SvgPicture.asset("assets/icons/ellipsis-v.svg"),
                  ],
                ),
                Spacer(),
                Text(
                  subject.name,
                  style: Constants.lessonTitleTextStyle
                      .copyWith(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
