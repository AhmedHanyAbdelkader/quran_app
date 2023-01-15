import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_app/app/constant.dart';
import 'package:quran_app/colors.dart';
import 'package:quran_app/presentation/screens/surah_screen.dart';
import 'package:quran_app/routes_manager.dart';

class ReadingListScreen extends StatefulWidget {
  const ReadingListScreen({Key? key}) : super(key: key);

  @override
  State<ReadingListScreen> createState() => _ReadingListScreenState();
}

class _ReadingListScreenState extends State<ReadingListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppLightColors.orange,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Quran',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      drawer: Container(
        width: 250,
        child: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          'https://png.pngtree.com/png-clipart/20190516/original/pngtree-book-of-quran-png-image_3561413.jpg'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Al Quran',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text('Setting'),
                leading: Icon(Icons.settings),
                onTap: () {
                  Navigator.pushNamed(context, Routes.settingsScreenRoute);
                },
              ),
              ListTile(
                title: Text('Rating'),
                leading: Icon(Icons.rate_review_outlined),
                onTap: () {},
              ),
              ListTile(
                title: Text('Sharing'),
                leading: Icon(Icons.share),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppLightColors.orange,
        onPressed: () {},
        child: Icon(
          Icons.save,
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) =>
            builtHomePage(item: arabicName[index], context: context),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 1.5,
            width: double.infinity,
            color: Colors.grey[300],
          ),
        ),
        itemCount: arabicName.length,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // FlutterNativeSplash.remove();
  }
}

Widget builtHomePage(
        {required Map<String, dynamic> item, required BuildContext context}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SurahScreen(surahNumber: item['number']),
            ),
          );
        },
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    quran.getVerseEndSymbol(item['numberOfAyahs']),
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'اياتها',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    item['name'],
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    item['revelationType'] == 'Meccan' ? 'مكية' : 'مدنية',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
