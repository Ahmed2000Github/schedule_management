import 'package:flutter/material.dart';
import 'package:schedule_management/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule_management/models/Lesson.dart';
import 'package:schedule_management/widgets/lesson_card.dart';

class CalendarPage extends StatelessWidget {
  final _daysList = [
    {"dayLetter": 'S', "day": '21'},
    {"dayLetter": 'M', "day": '22'},
    {"dayLetter": 'T', "day": '23'},
    {"dayLetter": 'W', "day": '24'},
    {"dayLetter": 'T', "day": '25'},
    {"dayLetter": 'F', "day": '26'},
    {"dayLetter": 'S', "day": '27'},
  ];
  final _timesList = [
    {
      "startTime": '11:35',
      "endTime": '13:05',
    },
    {
      "startTime": '13:15',
      "endTime": '14:45',
    },
    {
      "startTime": '15:10',
      "endTime": '16:40',
    },
  ];
  final _lessons = [
    Lesson(
        subject: "Mathematics",
        chapter: "Chapter 1: Introduction",
        location: "Room 6-205",
        professor: "Brooklyn Williamsan",
        profAvatar: "person1"),
    Lesson(
        subject: "Biology",
        chapter: "Chapter 3: Animal Kingdom",
        location: "Room 2-168",
        professor: "Julie Watson",
        profAvatar: "person2"),
    Lesson(
        subject: "Geography",
        chapter: "Chapter 3: Economy USA",
        location: "Room 1-403",
        professor: "Jenny Alexander",
        profAvatar: "person3"),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Constants.horizontalPadding),
              child: Row(
                children: [
                  Text("24",
                      style: Constants.titleTextStyle.copyWith(
                        fontSize: 44,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Wed",
                        style: Constants.subTitleTextStyle,
                      ),
                      Text(
                        "Jan 2020",
                        style: Constants.subTitleTextStyle,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                      decoration: BoxDecoration(
                        color: Constants.secondaryColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "Today",
                        style: Constants.lessonTitleTextStyle.copyWith(
                          color: Constants.secondaryColor,
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Constants.horizontalPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(_daysList.length, (index) {
                          final day = _daysList[index];
                          final isCurrentDay =
                              int.parse(day['day'] as String) == 24;
                          return Container(
                            width: (width -
                                    2 * Constants.horizontalPadding -
                                    6 * 16) /
                                7,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color:
                                  isCurrentDay ? Constants.primaryColor : null,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  day['dayLetter'] as String,
                                  style: Constants.subTitleTextStyle.copyWith(
                                    color: isCurrentDay
                                        ? Colors.white
                                        : Constants.disabledTextColor,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  day['day'] as String,
                                  style:
                                      Constants.lessonTitleTextStyle.copyWith(
                                    color: isCurrentDay
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        color: Constants.disabledTextColor.withOpacity(.2),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Constants.horizontalPadding),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    "Time",
                                    style: Constants.subTitleTextStyle,
                                  ),
                                ),
                                const Text(
                                  "Course",
                                  style: Constants.subTitleTextStyle,
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                    "assets/icons/sort-amount-down.svg")
                              ],
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              child: ListView(
                                children:
                                    List.generate(_timesList.length, (index) {
                                  final period = _timesList[index];
                                  final course = _lessons[index];
                                  final isCurrentLesson = index == 0;
                                  return SizedBox(
                                    height: 147,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 60,
                                          child: Column(
                                            children: [
                                              Text(
                                                period['startTime'] as String,
                                                style: Constants
                                                    .startTimeTextStyle,
                                              ),
                                              Text(
                                                period['endTime'] as String,
                                                style:
                                                    Constants.subTitleTextStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const VerticalDivider(),
                                        Expanded(
                                            child: LessonCard(
                                          lesson: course,
                                          bgColor: isCurrentLesson
                                              ? Constants.secondaryColor
                                              : null,
                                        ))
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
