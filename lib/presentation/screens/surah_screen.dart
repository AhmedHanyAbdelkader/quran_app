import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/data/data_source/remote_data_source.dart';
import 'package:quran_app/presentation/controllers/bloc/quran_bloc.dart';
import 'package:quran_app/presentation/controllers/bloc/quran_events.dart';
import 'package:quran_app/presentation/controllers/bloc/quran_state.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({Key? key, required this.surahNumber}) : super(key: key);
  final int surahNumber;

  @override
  Widget build(BuildContext context) {
    QuranRemoteDataource quranRemoteDataource = QuranRemoteDataource();
    return BlocProvider(
      create: (BuildContext context) => QuranBloc(quranRemoteDataource)
        ..add(GetSurahEvent(surahNumber: surahNumber)),
      child: SafeArea(child: Scaffold(
        body: BlocBuilder<QuranBloc, QuranState>(
          builder: (context, state) {
            switch (state.getSurahRequestState) {
              case RequestState.loading:
                return CircularProgressIndicator();
              case RequestState.loaded:
                return Center(
                  child: Container(
                    child: Text(state.getSurahRequestState.name),
                  ),
                );
            }
          },
        ),
      )),
    );
  }
}
