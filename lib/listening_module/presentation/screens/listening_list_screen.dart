import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/services/service_locator.dart';
import 'package:quran_app/core/utils/enums.dart';
import 'package:quran_app/listening_module/presentation/controllers/bloc/surah_listening_bloc.dart';
import 'package:quran_app/listening_module/presentation/controllers/bloc/surah_listening_event.dart';
import 'package:quran_app/listening_module/presentation/controllers/bloc/surah_listening_state.dart';

class ListeningListScreen extends StatefulWidget {
   ListeningListScreen({Key? key}) : super(key: key);

  @override
  State<ListeningListScreen> createState() => _ListeningListScreenState();
}

class _ListeningListScreenState extends State<ListeningListScreen> {
  late SurahBloc _getSurahBloc;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (BuildContext context) => sl<SurahBloc>(),
      child: Scaffold(
        body: Column(
          children: [
            BlocBuilder<SurahBloc,SurahState>(
              bloc : _getSurahBloc = sl<SurahBloc>(),
              builder: (context , state){
                return Column(
                  children: [
                MaterialButton(
                child: Text('test get surah listening...'),
                onPressed: () {
                  _getSurahBloc.add(GetSurahEvent(1));
                },
                ),
                    state.getSurahRequestState == GetSurahRequestState.loaded
                        ? Text('${state.surah.data!.name}')
                        : SizedBox()
                  ],
                );
              },

            )
          ],
        ),
      ),
    ));
  }
}
