import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../../domain/models/surah.dart';
import '../../data/quran_api_service.dart';
import 'package:dio/dio.dart';

class CurrentSurahScreen extends StatefulWidget {
  final int number;
  final String name;

  const CurrentSurahScreen({super.key, required this.number, required this.name});

  @override
  State<CurrentSurahScreen> createState() => _CurrentSurahScreenState();
}

class _CurrentSurahScreenState extends State<CurrentSurahScreen> {
  late Future<List<Ayah>> ayahs;
  final player = AudioPlayer();
  final QuranApiService quranApiService = QuranApiService(Dio());

  int _currentAyahIndex = 0;
  final ValueNotifier<bool> isPlaying = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    ayahs = quranApiService.fetchAyahList(widget.number);

    player.playerStateStream.listen((state) {
      isPlaying.value = state.playing;
      if (state.processingState == ProcessingState.completed) {
        _playNextAyah();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: FutureBuilder<List<Ayah>>(
        future: ayahs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  color: _currentAyahIndex == index ? Colors.blue[100] : null, 
                  child: ListTile(
                    titleAlignment: ListTileTitleAlignment.titleHeight,
                    minLeadingWidth: 20,
                    contentPadding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                    leading: 
                      Text(
                        snapshot.data![index].numberInSurah.toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    title: Text(
                      snapshot.data![index].text,
                      style: const TextStyle(fontSize: 24),
                    ),
                    subtitle: Text(
                      snapshot.data![index].translation,
                      style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                    ),
                    onTap: () {
                      setState(() {
                        _currentAyahIndex = index;
                      });
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: buildBottomAppBar(context),
    );
  }

  BottomAppBar buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      height: 120,
      child: FutureBuilder<List<Ayah>>(
        future: ayahs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous),
                      onPressed: _playPreviousAyah,
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: isPlaying,
                      builder: (context, playing, _) {
                        return IconButton(
                          icon: Icon(playing ? Icons.pause : Icons.play_arrow),
                          onPressed: () {
                            if (playing) {
                              _pauseAudio();
                            } else {
                              _playCurrentAyah();
                            }
                          },
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next),
                      onPressed: _playNextAyah,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: StreamBuilder<Duration>(
                        stream: player.positionStream,
                        builder: (context, snapshot) {
                          final position = snapshot.data ?? Duration.zero;
                          final total = player.duration ?? Duration.zero;
                          return ProgressBar(
                            progress: position,
                            total: total,
                            onSeek: (duration) {
                              player.seek(duration);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<void> _playCurrentAyah() async {
    final ayah = await ayahs;
    final audioUrl = ayah[_currentAyahIndex].audio;

    try {
      await player.setUrl(audioUrl);
      player.play();
    } catch (e) {
      if (kDebugMode) {
        print('Failed to play audio: $e');
      }
    }
  }

    Future<void> _playNextAyah() async {
    final ayah = await ayahs;
    if (_currentAyahIndex < ayah.length - 1) {
      setState(() { 
        _currentAyahIndex++;
      });
      await _playCurrentAyah();
    }
  }

  Future<void> _playPreviousAyah() async {
    if (_currentAyahIndex > 0) {
      setState(() { 
        _currentAyahIndex--;
      });
      await _playCurrentAyah();
    }
  }

  Future<void> _pauseAudio() async {
    try {
      await player.pause();
    } catch (e) {
      if (kDebugMode) {
        print('Failed to pause audio: $e');
      }
    }
  }

  @override
  void dispose() {
    isPlaying.dispose();
    player.dispose();
    super.dispose();
  }
}
