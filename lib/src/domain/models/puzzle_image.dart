import 'package:equatable/equatable.dart';

class PuzzleImage extends Equatable {
  final String name;
  final String assetPath;
  final String soundPath;

  const PuzzleImage({
    required this.name,
    required this.assetPath,
    required this.soundPath,
  });

  @override
  List<Object?> get props => [
        name,
        assetPath,
        soundPath,
      ];
}

class ElementImage extends Equatable {
  final String name;
  final String assetPath;
  final String soundPath;

  const ElementImage({
    required this.name,
    required this.assetPath,
    required this.soundPath,
  });

  @override
  List<Object?> get props => [
    name,
    assetPath,
    soundPath,
  ];
}

