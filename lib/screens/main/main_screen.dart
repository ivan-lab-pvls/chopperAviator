
import 'package:auto_route/auto_route.dart';
import 'package:chopper_crew_app/screens/chopper_dash/chopper_dash_list/chopper_dash_list_screen.dart';
import 'package:chopper_crew_app/screens/news/news_list/news_list_screen.dart';
import 'package:chopper_crew_app/screens/puzzle/puzzle_list/puzzle_list_screen.dart';
import 'package:chopper_crew_app/screens/settings/settings_screen.dart';
import 'package:chopper_crew_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final _tabs = [ChopperDashListScreen(), PuzzleListScreen(), NewsListScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          iconTheme: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return IconThemeData(color: AppColors.orange);
            } else {
              return IconThemeData(color: AppColors.black14);
            }
          }),
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.orange);
            }
            return TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: AppColors.black14);
          }),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedIndex: _currentIndex,
          backgroundColor: AppColors.black5,
          indicatorColor: Colors.transparent,
          destinations: [
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/tab-icons/helicopter.svg', color: AppColors.orange),
              icon: SvgPicture.asset('assets/images/tab-icons/helicopter.svg', color: AppColors.black14),
              label: 'Chopper Dash',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/tab-icons/puzzle.svg', color: AppColors.orange),
              icon: SvgPicture.asset('assets/images/tab-icons/puzzle.svg', color: AppColors.black14),
              label: 'Puzzle',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/tab-icons/news.svg', color: AppColors.orange),
              icon: SvgPicture.asset('assets/images/tab-icons/news.svg', color: AppColors.black14),
              label: 'News',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/tab-icons/settings.svg', color: AppColors.orange),
              icon: SvgPicture.asset('assets/images/tab-icons/settings.svg', color: AppColors.black14),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}