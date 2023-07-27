import 'package:audioplayers/audioplayers.dart';

import '../api/api.dart';

class SoundController {
  playStarSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('sounds/starClick.mp3'));
  }
}