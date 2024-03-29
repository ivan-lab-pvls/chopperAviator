
import 'package:auto_route/auto_route.dart';
import 'package:chopper_crew_app/models/puzzle_model.dart';
import 'package:chopper_crew_app/repository/puzzle_repository.dart';
import 'package:chopper_crew_app/router/router.dart';
import 'package:chopper_crew_app/theme/colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PuzzleListScreen extends StatefulWidget {
  const PuzzleListScreen({super.key});

  @override
  State<PuzzleListScreen> createState() => _PuzzleListScreenState();
}

class _PuzzleListScreenState extends State<PuzzleListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Puzzles',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Please select which puzzle image you would like to assemble.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black40,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: puzzleRepository.length,
                    separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 20),
                    itemBuilder: (BuildContext context, int index) {
                      final PuzzleModel _puzzle = puzzleRepository[index];
                      return GestureDetector(
                        onTap: () {
                          context.router.push(PuzzleGameRoute(puzzle: _puzzle));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  _puzzle.image,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                _puzzle.title,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
