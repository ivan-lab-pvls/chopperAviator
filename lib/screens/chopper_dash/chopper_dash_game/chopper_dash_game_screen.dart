import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:chopper_crew_app/models/chopper_model.dart';
import 'package:chopper_crew_app/router/router.dart';
import 'package:chopper_crew_app/screens/chopper_dash/coins_bloc/coins_bloc.dart';
import 'package:chopper_crew_app/theme/colors.dart';
import 'package:chopper_crew_app/widgets/action_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class ChopperDashGameScreen extends StatefulWidget {
  final ChopperModel chopper;
  final int coins;

  const ChopperDashGameScreen(
      {super.key, required this.chopper, required this.coins});

  @override
  State<ChopperDashGameScreen> createState() => _ChopperDashGameScreenState();
}

class _ChopperDashGameScreenState extends State<ChopperDashGameScreen> {
  double _left = 0;
  double _bottom = 0;

  double coins = 0;
  double coefficient = 1.0;
  bool gameStarted = false;
  int timerDuration = 0;
  Timer _timer = Timer(Duration(seconds: 0), () {});
  Timer _updateTimer = Timer(Duration(seconds: 0), () {});

  List<Offset> positions = [];

  @override
  void initState() {
    super.initState();
    coins = widget.coins.toDouble();
    gameStarted = true;
    startGame();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _left = MediaQuery.of(context).size.width;
        _bottom = MediaQuery.of(context).size.height * 0.5;
      });
    });
  }

  void startGame() {
    timerDuration = Random().nextInt(12) + 5;
    // timerDuration = 7;

    if (gameStarted) {
      _updateTimer = Timer.periodic(Duration(milliseconds: 70), (timer) {
        setState(() {
          coefficient += 0.01;
        });
      });
    }
    _timer = Timer(Duration(seconds: timerDuration), () {
      if (gameStarted) {
        context.read<CoinsBloc>().add(DecrementCoinsEvent(coins: widget.coins));
        context.router.push(ResultRoute(coins: 0, result: 'Lose'));
      }
    });
  }

  void stopGame() {
    if (gameStarted) {
      gameStarted = false;
      _timer.cancel();
      _updateTimer.cancel();
    }
  }

  void resetGame() {
    setState(() {
      _updateTimer.cancel();
      coins = 0;
      gameStarted = false;
      coefficient = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _mediaHeight = MediaQuery.of(context).size.height;
    final double _mediaWidth = MediaQuery.of(context).size.width;

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
      body: Container(
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
            Center(
              child: Text(
                'x${coefficient.toStringAsFixed(2)}',
                style: TextStyle(
                  color: AppColors.yellow,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: AppColors.white40,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/chopper-dash/coin.png',
                        width: 32,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '${coins.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              child: CustomPaint(
                painter: TrajectoryPainter(positions),
              ),
            ),
            TweenAnimationBuilder(
              curve: Curves.linear,
              tween: BezierTween(
                begin: Offset(-100, _mediaHeight * 0.8),
                control: Offset(300, 300),
                end: Offset(_mediaWidth * 0.75, 0),
              ),
              duration: Duration(
                  seconds: timerDuration + Random().nextInt(2) + 5),
              builder: (BuildContext context, Offset value, Widget? child) {
                positions.add(value);

                return Positioned(
                  left: value.dx,
                  top: value.dy,
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(-20 / 360),
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Lottie.asset(widget.chopper.imageJson),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
          text: 'Stop',
          width: 350,
          onTap: () {
            stopGame();
            final double winnings = coins * coefficient;
            context.read<CoinsBloc>().add(IncrementCoinsEvent(coins: winnings));
            context.router.push(ResultRoute(coins: winnings, result: 'Win'));
          }),
    );
  }
}

class BezierTween extends Tween<Offset> {
  final Offset begin;
  final Offset end;
  final Offset control;

  BezierTween({required this.begin, required this.end, required this.control})
      : super(begin: begin, end: end);

  @override
  Offset lerp(double t) {
    final t1 = 1 - t;
    return begin * t1 * t1 + control * 2 * t1 * t + end * t * t;
  }
}

class TrajectoryPainter extends CustomPainter {
  List<Offset> positions;

  TrajectoryPainter(this.positions);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Path path = Path();
    path.moveTo(positions.first.dx+50, positions.first.dy+50);

    for (int i = 1; i < positions.length; i++) {
      path.lineTo(positions[i].dx+50, positions[i].dy+50);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TrajectoryPainter oldDelegate) {
    return true;
  }
}
