import 'dart:async';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_app/core/global/colors/app_light_colors.dart';
import 'package:quran_app/reading_module/data/data_source/remote_data_source.dart';
import 'package:quran_app/reading_module/presentation/controllers/bloc/quran_bloc.dart';
import 'package:quran_app/reading_module/presentation/controllers/bloc/quran_events.dart';
import 'package:quran_app/reading_module/presentation/controllers/bloc/quran_state.dart';

class SurahScreen extends StatefulWidget {
  const SurahScreen({Key? key, required this.surahNumber}) : super(key: key);
  final int surahNumber;

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  final _player = AudioPlayer();
  Duration? currentAyahDuration;
 // Timer? timer;

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
  }

  Future playAudio(String audioUrl) async {
    await _player.setUrl(audioUrl);
    _player.play();
    currentAyahDuration = _player.duration;
    print('ayah Time ${currentAyahDuration.runtimeType}}');
    //await Duration(seconds: currentAyahDuration as Timer);
  }

  @override
  void dispose() {
    _player.dispose();
    // timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    QuranRemoteDataource quranRemoteDataource = QuranRemoteDataource();
    return BlocProvider(
      create: (BuildContext context) => QuranBloc(quranRemoteDataource)
        ..add(GetSurahEvent(surahNumber: widget.surahNumber)),
      child: SafeArea(child: Scaffold(
        body: BlocBuilder<QuranBloc, QuranState>(
          builder: (context, state) {
            switch (state.getSurahRequestState) {
              case RequestState.loading:
                return Center(
                    child: CircularProgressIndicator(
                  color: AppLightColors.orange,
                ));
              case RequestState.loaded:
                int count = state.surah.data!.ayahs.length;
                int index = widget.surahNumber;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: Image.asset('assets/images/basmalla_frame.png',
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                              height: 80),
                        ),
                        Center(
                          child: Text(
                            '${state.surah.data!.name}',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    widget.surahNumber != 9
                    ? Text(
                            'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Kitab',
                              fontSize: 25,
                              color: Colors.black87,
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 10,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: RichText(
                        textAlign:
                            count <= 20 ? TextAlign.center : TextAlign.justify,
                        text: TextSpan(
                          children: [
                            for (var i = 0; i < count; i++) ...{
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    setState(() {
                                      state.surah.data!.ayahs[i].isClicked =
                                          true;
                                    });
                                    await playAudio(
                                        state.surah.data!.ayahs[i].audio);
                                     Timer(
                                      currentAyahDuration!, 
                                      () {
                                      setState(() {
                                        state.surah.data!.ayahs[i].isClicked =
                                            false;
                                      });
                                    });

                                    debugPrint(
                                        '${state.surah.data!.ayahs[i].text}');
                                  },
                                text: i != 0
                                    ? ' ' +
                                        state.surah.data!.ayahs[i].text +
                                        ' ' +
                                        quran.getVerseEndSymbol(i + 1)
                                    : ' ' +
                                        state.surah.data!.ayahs[0].text.replaceAll(
                                            "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
                                            '') +
                                        ' ' +
                                        quran.getVerseEndSymbol(i + 1),
                                style: TextStyle(
                                  fontFamily: 'Kitab',
                                  fontSize: 25,
                                  color: Colors.black87,
                                  backgroundColor:
                                      state.surah.data!.ayahs[i].isClicked ==
                                              true
                                          ? AppLightColors.orange
                                          : AppLightColors.whiteColor,
                                ),
                              ),
                            }
                          ],
                        ),
                      ),
                    ),
                  ]),
                );
            }
          },
        ),
      )),
    );
  }
}
