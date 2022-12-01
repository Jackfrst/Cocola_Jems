import 'dart:typed_data';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart';
import 'package:cocola_jems/src/domain/models/puzzle_image.dart';
import 'package:cocola_jems/src/domain/repositories/images_repository.dart';

const elementOption = <ElementImage>[
  ElementImage(
    name: '6',
    assetPath: 'assets/planets/6.png',
    soundPath: '',
  ),
  ElementImage(
    name: '7',
    assetPath: 'assets/planets/7.png',
    soundPath: '',
  ),
  ElementImage(
    name: '3',
    assetPath: 'assets/planets/3.png',
    soundPath: '',
  ),
  ElementImage(
    name: '4',
    assetPath: 'assets/planets/4.png',
    soundPath: '',
  ),
  ElementImage(
    name: '1',
    assetPath: 'assets/planets/1.png',
    soundPath: '',
  ),
  ElementImage(
    name: '5',
    assetPath: 'assets/planets/5.png',
    soundPath: '',
  ),
  ElementImage(
    name: '3',
    assetPath: 'assets/planets/3.png',
    soundPath: '',
  ),
  ElementImage(
    name: '1',
    assetPath: 'assets/planets/1.png',
    soundPath: '',
  ),
  ElementImage(
    name: '2',
    assetPath: 'assets/planets/2.png',
    soundPath: '',
  ),
];


const puzzleOptions = <PuzzleImage>[
  PuzzleImage(
    name: 'Numeric',
    assetPath: 'assets/images/numeric-puzzle.png',
    soundPath: '',
  ),
  PuzzleImage(
    name: '1',
    assetPath: 'assets/Telescope/1.jpg',
    soundPath: 'assets/sounds/tiger.mp3',
  ),
  PuzzleImage(
    name: '2',
    assetPath: 'assets/q_img/1_1.jpg',
    soundPath: 'assets/sounds/1.mp3',
  ),
  PuzzleImage(
    name: '3',
    assetPath: 'assets/q_img/2_2.jpg',
    soundPath: 'assets/sounds/2.mp3',
  ),
  PuzzleImage(
    name: '4',
    assetPath: 'assets/q_img/3_1.jpg',
    soundPath: 'assets/sounds/3.mp3',
  ),
  PuzzleImage(
    name: '5',
    assetPath: 'assets/q_img/5_1.jpg',
    soundPath: 'assets/sounds/1.mp3',
  ),
  PuzzleImage(
    name: '6',
    assetPath: 'assets/animals/koala.png',
    soundPath: 'assets/sounds/tiger.mp3',
  ),
];

Future<Image> decodeAsset(ByteData bytes) async {
  return decodeImage(
    bytes.buffer.asUint8List(),
  )!;
}

class SPlitData {
  final Image image;
  final int crossAxisCount;

  SPlitData(this.image, this.crossAxisCount);
}

Future<List<Uint8List>> splitImage(SPlitData data) {
  final image = data.image;
  final crossAxisCount = data.crossAxisCount;
  final int length = (image.width / crossAxisCount).round();
  List<Uint8List> pieceList = [];

  for (int y = 0; y < crossAxisCount; y++) {
    for (int x = 0; x < crossAxisCount; x++) {
      pieceList.add(
        Uint8List.fromList(
          encodePng(
            copyCrop(
              image,
              x * length,
              y * length,
              length,
              length,
            ),
          ),
        ),
      );
    }
  }
  return Future.value(pieceList);
}

class ImagesRepositoryImpl implements ImagesRepository {
  Map<String, Image> cache = {};

  @override
  Future<List<Uint8List>> split(String asset, int crossAxisCount) async {
    late Image image;
    if (cache.containsKey(asset)) {
      image = cache[asset]!;
    } else {
      final bytes = await rootBundle.load(asset);

      /// use compute because theimage package is a pure dart package
      /// so to avoid bad ui performance we do this task in a different
      /// isolate
      image = await compute(decodeAsset, bytes);

      final width = math.min(image.width, image.height);

      /// convert to square
      image = copyResizeCropSquare(image, width);
      cache[asset] = image;
    }

    final pieces = await compute(
      splitImage,
      SPlitData(image, crossAxisCount),
    );

    return pieces;
  }
}
