import 'package:audioplayers/audioplayers.dart';

import 'api.dart';

mixin SoundApi on BaseApi {
  Future starSound() async {
    final player = AudioPlayer();
    await player.setSource(UrlSource('https://example.com/my-audio.wav'));
  }
}