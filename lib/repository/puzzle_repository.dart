

import 'package:chopper_crew_app/models/puzzle_model.dart';
import 'package:chopper_crew_app/models/puzzle_pieces_model.dart';

final List<PuzzleModel> puzzleRepository = [
  PuzzleModel(
      title: 'The hand with the airplane',
      image: 'assets/images/puzzle/1/full-1.png',
      puzzlePieces: List<PuzzlePieceModel>.generate(
          16,
              (i) => PuzzlePieceModel(
              index: i, pieces: 'assets/images/puzzle/1/${i + 1}.png'))),
  PuzzleModel(
      title: 'Airplane wing',
      image: 'assets/images/puzzle/2/full-2.png',
      puzzlePieces: List<PuzzlePieceModel>.generate(
          16,
              (i) => PuzzlePieceModel(
              index: i, pieces: 'assets/images/puzzle/2/${i + 1}.png'))),
  PuzzleModel(
      title: 'The window of an airplane',
      image: 'assets/images/puzzle/3/full-3.png',
      puzzlePieces: List<PuzzlePieceModel>.generate(
          16,
              (i) => PuzzlePieceModel(
              index: i, pieces: 'assets/images/puzzle/3/${i + 1}.png'))),
  PuzzleModel(
      title: 'A toy model airplane',
      image: 'assets/images/puzzle/4/full-4.png',
      puzzlePieces: List<PuzzlePieceModel>.generate(
          16,
              (i) => PuzzlePieceModel(
              index: i, pieces: 'assets/images/puzzle/4/${i + 1}.png'))),
  PuzzleModel(
      title: 'An airplane in flight',
      image: 'assets/images/puzzle/5/full-5.png',
      puzzlePieces: List<PuzzlePieceModel>.generate(
          16,
              (i) => PuzzlePieceModel(
              index: i, pieces: 'assets/images/puzzle/5/${i + 1}.png'))),
];