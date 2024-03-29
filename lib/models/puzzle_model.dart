import 'package:chopper_crew_app/models/puzzle_pieces_model.dart';

class PuzzleModel {
  final String title;
  final String image;
  final List<PuzzlePieceModel> puzzlePieces;

  PuzzleModel({
    required this.image,
    required this.title,
    required this.puzzlePieces,
  });
}