import 'package:flutter/material.dart';
import 'package:quran_app/core/global/colors/app_light_colors.dart';
import 'package:quran_app/core/utils/dummy.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppLightColors.whiteColor,
      body: Center(
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 20.0,
          ),
          itemCount: myList.length,
          itemBuilder: (context, index) {
            return buildGridItem(index,context);
          },
        ),
      ),
    ));
  }

  Widget buildGridItem(int index,context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context,myList[index]['routeName']);
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppLightColors.whiteColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 30,
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 0,
                offset: Offset(7, 7),
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  myList[index]['icon'],
                  color: AppLightColors.orange,
                  size: 120,
                ),
                Text(
                  myList[index]['text'],
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
