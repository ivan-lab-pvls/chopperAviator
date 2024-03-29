import 'package:auto_route/auto_route.dart';
import 'package:chopper_crew_app/theme/colors.dart';
import 'package:chopper_crew_app/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

class ReadX extends StatelessWidget {
  final String dataForR;

  const ReadX({Key? key, required this.dataForR}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 255, 200),
      ),
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(dataForR)),
        ),
      ),
    );
  }
}

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Settings',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 20),
              AppContainer(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Share.share('Play with us in Chopper Avia Game!');
                      },
                      child: Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16.0))),
                                child: SvgPicture.asset(
                                    'assets/images/settings/share.svg'),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Share with friends',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.black40,
                          ),
                        ],
                      )),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) => const ReadX(
                                    dataForR:
                                        'https://docs.google.com/document/d/1OE3TwAq9y3J07oV2l_1dHrABheoMoNDCK9qIlFZyTVo/edit?usp=sharing',
                                  )),
                        );
                      },
                      child: Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16.0))),
                                child: SvgPicture.asset(
                                    'assets/images/settings/file-sign.svg'),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Terms of conditions',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.black40,
                          ),
                        ],
                      )),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) => const ReadX(
                                    dataForR:
                                        'https://docs.google.com/document/d/1qSgXQ-vXh0cy0YHvYoOFzkl6JrBUz0CdezKgZrLIEbo/edit?usp=sharing',
                                  )),
                        );
                      },
                      child: Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16.0))),
                                child: SvgPicture.asset(
                                    'assets/images/settings/lock.svg'),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Privacy Policy',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.black40,
                          ),
                        ],
                      )),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) => const ReadX(
                                    dataForR:
                                        'https://forms.gle/KBo7XThx1wHtn1bTA',
                                  )),
                        );
                      },
                      child: Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16.0))),
                                child: SvgPicture.asset(
                                    'assets/images/settings/support.svg'),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Write support',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.black40,
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
