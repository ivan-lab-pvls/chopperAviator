import 'package:auto_route/auto_route.dart';
import 'package:chopper_crew_app/models/chopper_model.dart';
import 'package:chopper_crew_app/router/router.dart';
import 'package:chopper_crew_app/screens/chopper_dash/coins_bloc/coins_bloc.dart';
import 'package:chopper_crew_app/sevices/shared_preferences.dart';
import 'package:chopper_crew_app/theme/colors.dart';
import 'package:chopper_crew_app/widgets/action_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class EnterCoinsScreen extends StatefulWidget {
  final ChopperModel chopper;

  const EnterCoinsScreen({super.key, required this.chopper});

  @override
  State<EnterCoinsScreen> createState() => _EnterCoinsScreenState();
}

class _EnterCoinsScreenState extends State<EnterCoinsScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black5,
        centerTitle: true,
        leadingWidth: 110,
        title: Text(
          'Chopper Dash',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GestureDetector(
            onTap: () {
              context.router.pop();
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new, color: AppColors.orange),
                SizedBox(width: 5),
                Text(
                  'Back',
                  style: TextStyle(
                    color: AppColors.orange,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/chopper-dash/bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    BlocProvider(
                      create: (context) => CoinsBloc()..add(GetCoinsEvent()),
                      child: BlocConsumer<CoinsBloc, CoinsState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is LoadedCoinsState) {
                            return Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: AppColors.white40,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/images/chopper-dash/coin.png',
                                      width: 32,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '${state.coins.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppColors.white40,
                              borderRadius: BorderRadius.all(Radius.circular(16.0))),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'To start the game, enter the number of coins you want to collect.',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Goal coins',
                                style: TextStyle(
                                  color: AppColors.white40,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5),
                              TextField(
                                style: TextStyle(color: Colors.white),
                                controller: _controller,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.black5,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 12),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                                ),
                              ),
                              SizedBox(height: 20),
                              Align(
                                alignment: Alignment.center,
                                child: ActionButtonWidget(
                                    text: 'Start',
                                    width: 350,
                                    onTap: () async {
                                      if (_controller.text.isNotEmpty && _controller.text != '0') {
                                        SharedPreferencesService storage =
                                        await SharedPreferencesService.getInstance();

                                        if (storage.coins < int.parse(_controller.text)) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              backgroundColor: AppColors.orange,
                                              content: Text(
                                                'Not enough coins!',
                                                style: TextStyle(color: AppColors.white),
                                              ),
                                            ),
                                          );
                                        } else {
                                          context.router.push(ChopperDashGameRoute(
                                              chopper: widget.chopper,
                                              coins: int.parse(_controller.text)));
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            backgroundColor: AppColors.orange,
                                            content: Text(
                                              'Firstly, enter goal coins!',
                                              style: TextStyle(color: AppColors.white),
                                            ),
                                          ),
                                        );
                                      }
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
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
