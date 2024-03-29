import 'package:chopper_crew_app/models/chopper_model.dart';
import 'package:chopper_crew_app/repository/chopper_repository.dart';
import 'package:chopper_crew_app/router/router.dart';
import 'package:chopper_crew_app/theme/colors.dart';
import 'package:chopper_crew_app/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class ChopperDashListScreen extends StatefulWidget {
  const ChopperDashListScreen({super.key});

  @override
  State<ChopperDashListScreen> createState() =>
      _ChopperDashListScreenState();
}

class _ChopperDashListScreenState extends State<ChopperDashListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Text(
                      'Chopper Dash',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Choose an a helicopter to start the game.',
                      style: TextStyle(
                        color: AppColors.black40,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Container(
                  child: ListView.separated(
                    padding: EdgeInsets.all(16),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: chopperRepository.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(width: 15),
                    itemBuilder: (BuildContext context, int index) {
                      final ChopperModel _chopper = chopperRepository[index];
                      return GestureDetector(
                        onTap: () {
                          context.router.push(EnterCoinsRoute(chopper: _chopper));
                        },
                        child: AppContainer(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(height: 5),
                                  Lottie.asset(_chopper.imageJson, width: 200),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        _chopper.name,
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
