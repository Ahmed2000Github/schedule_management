// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule_management/constants.dart';
import 'package:schedule_management/models/Lesson.dart';
import 'package:schedule_management/models/subject.dart';
import 'package:schedule_management/widgets/lesson_card.dart';
import 'package:schedule_management/widgets/subject_card.dart';

class HomePage extends StatelessWidget {
  final _subjects = [
    Subject(
        name: "Mathematics",
        logo: "square-root-of-x",
        bgColor: Constants.primaryColor,
        shapeColor: Constants.lightOrangeColor),
    Subject(
        name: "Geography",
        logo: "earth",
        bgColor: Constants.lightPurpleColor,
        shapeColor: Constants.darkBlueColor),
    Subject(
        name: "Mathematics",
        logo: "square-root-of-x",
        bgColor: Constants.lightOrangeColor,
        shapeColor: Constants.primaryColor),
  ];

  final _nextLesson = Lesson(
      subject: "Biology",
      chapter: "Chapter 3: Animal Kingdom",
      location: "Room 2-168",
      professor: "Julie Watson",
      profAvatar: "person2");

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Constants.darkGreenColor,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Constants.horizontalPadding),
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 48,
                      width: 48,
                      child: FloatingActionButton(
                        backgroundColor: Colors.white.withOpacity(.1),
                        elevation: 0,
                        onPressed: () {},
                        child: SvgPicture.asset('assets/icons/searchsvg.svg'),
                      ),
                    ),
                  ),
                  SizedBox(height: height * .24),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Constants.horizontalPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Subjects",
                                  style: Constants.titleTextStyle,
                                ),
                                Text(
                                  "Recommendations for you",
                                  style: Constants.subTitleTextStyle,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 119,
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            padding: const EdgeInsets.only(
                                left: Constants.horizontalPadding),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: _subjects
                                  .map((subject) => Row(
                                        children: [
                                          SubjectCard(subject: subject),
                                          const SizedBox(width: 16),
                                        ],
                                      ))
                                  .toList(),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Constants.horizontalPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15),
                                Text(
                                  "Your Schedule",
                                  style: Constants.titleTextStyle,
                                ),
                                Text(
                                  "Next lessons",
                                  style: Constants.subTitleTextStyle,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Constants.horizontalPadding),
                              child: LessonCard(
                                lesson: _nextLesson,
                                hasShape: true,
                                bgColor: Constants.secondaryColor,
                              )),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                  right: 0,
                  top: 20,
                  child: Image.asset("assets/images/welcome.png",
                      height: height * .34))
            ],
          ),
        ));
  }
}
