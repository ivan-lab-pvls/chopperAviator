import 'package:auto_route/auto_route.dart';
import 'package:chopper_crew_app/models/puzzle_model.dart';
import 'package:chopper_crew_app/models/puzzle_pieces_model.dart';
import 'package:chopper_crew_app/theme/colors.dart';
import 'package:chopper_crew_app/widgets/action_button_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PuzzleGameScreen extends StatefulWidget {
  final PuzzleModel puzzle;

  const PuzzleGameScreen({super.key, required this.puzzle});

  @override
  State<PuzzleGameScreen> createState() => _PuzzleGameScreenState();
}

class _PuzzleGameScreenState extends State<PuzzleGameScreen> {
  List<PuzzlePieceModel> currentSequence = [];
  List<PuzzlePieceModel> puzzlePieces = [];
  List<PuzzlePieceModel> correctSequence = [];

  bool isDone = false;

  int selectedPieceIndex = -1;

  @override
  void initState() {
    initialPuzzle();
    currentSequence = puzzlePieces.toList()..shuffle();
    correctSequence = puzzlePieces.toList()
      ..sort((a, b) => a.index.compareTo(b.index));
    super.initState();
  }

  void initialPuzzle() {
    puzzlePieces = widget.puzzle.puzzlePieces;
  }

  void shuffleSequence() {
    currentSequence..shuffle();
    isDone = false;
    setState(() {});
  }

  void checkSequence() {
    if (listEquals(currentSequence, correctSequence)) {
      isDone = true;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.orange,
          content: Text(
            'Puzzle completed!',
            style: TextStyle(color: AppColors.white),
          ),
        ),
      );
    }
  }

  void swapPieces(int index1, int index2) {
    List<PuzzlePieceModel> newSequence = List.from(currentSequence);
    PuzzlePieceModel temp = newSequence[index1];
    newSequence[index1] = newSequence[index2];
    newSequence[index2] = temp;
    setState(() {
      currentSequence = newSequence;
      checkSequence();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.black5,
        centerTitle: true,
        leadingWidth: 110,
        leading: GestureDetector(
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
        title: Text(
          'Puzzle',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.black5,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      height: 165,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 165,
                            height: 165,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(widget.puzzle.image),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 165,
                                child: Text(
                                  widget.puzzle.title,
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              isDone ? ActionButtonWidget(
                                  text: 'Shuffle',
                                  width: 180,
                                  onTap: () {
                                    shuffleSequence();
                                  }) : SizedBox(
                                width: 165,
                                child: Text(
                                  'Put the puzzles together to make this picture',
                                  style: TextStyle(
                                    color: AppColors.black40,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.black5,
                  ),
                  padding: EdgeInsets.all(10),
                  height: 350,
                  width: 350,
                  child: Center(
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemCount: currentSequence.length,
                      itemBuilder: (context, index) {
                        PuzzlePieceModel piece = currentSequence[index];
                        return GestureDetector(
                          onTap: () {
                            if (selectedPieceIndex == -1) {
                              setState(() {
                                selectedPieceIndex = index;
                              });
                            } else {
                              if (selectedPieceIndex != index) {
                                swapPieces(selectedPieceIndex, index);
                              }
                              setState(() {
                                selectedPieceIndex = -1;
                              });
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.all(2),
                            color: Colors.white,
                            child: Center(
                              child: Image.asset(piece.pieces),
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
      ),
    );
  }
}