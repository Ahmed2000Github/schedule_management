import 'package:flutter/material.dart';
import 'package:schedule_management/constants.dart';
import 'package:schedule_management/pages/calendar_page.dart';
import 'package:schedule_management/pages/home_page.dart';
import 'package:schedule_management/pages/message_page.dart';
import 'package:schedule_management/pages/profile_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: [HomePage(), CalendarPage(), MessagePage(), ProfilePage()],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 10),
        child: BottomNavigationBar(
            onTap: (newIndex) {
              setState(() {
                _currentIndex = newIndex;
                _pageController.animateToPage(_currentIndex,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOut);
              });
            },
            currentIndex: _currentIndex,
            elevation: 0,
            backgroundColor: Constants.scaffoldBackgroundColor,
            selectedItemColor: Constants.primaryColor,
            unselectedItemColor: Constants.scaffoldBackgroundColor,
            showUnselectedLabels: true,
            selectedLabelStyle: Constants.subTitleTextStyle,
            unselectedLabelStyle:
                Constants.subTitleTextStyle.copyWith(color: Colors.white),
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/home.svg",
                    color: _getCurrentColor(0),
                  ),
                  label: '•'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/notes.svg",
                    color: _getCurrentColor(1),
                  ),
                  label: '•'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/comment.svg",
                    color: _getCurrentColor(2),
                  ),
                  label: '•'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/user.svg",
                    color: _getCurrentColor(3),
                  ),
                  label: '•'),
            ]),
      ),
    );
  }

  Color _getCurrentColor(int index) {
    return _currentIndex == index
        ? Constants.primaryColor
        : Constants.disabledIconColor;
  }
}
