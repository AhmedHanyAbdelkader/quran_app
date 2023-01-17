import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double isvalue = 25, isval = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF9000),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Center(
          child: Column(
            children: [
              Text(
                "Arabic Font Size:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Slider(
                value: isval,
                onChanged: (value) {
                  setState(() {
                    isval = value;
                    print(isvalue);
                  });
                },
                activeColor: Color(0xFFFF9000),
                //inactiveColor: Colors.green,
                max: 50,
                min: 15,
              ),
              Text(
                ' بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ',
                style: TextStyle(fontSize: isval, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(color: Colors.grey),
              SizedBox(
                height: 20,
              ),
              Text(
                'Mushaf Mode Font Size:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Slider(
                value: isvalue,
                onChanged: (value) {
                  setState(() {
                    isvalue = value;
                    print(isvalue);
                  });
                },
                activeColor: Color(0xFFFF9000),
                //inactiveColor: Colors.green,
                max: 50,
                min: 15,
              ),
              Text(
                ' بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ',
                style:
                TextStyle(fontSize: isvalue, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 45,
                    width: 80,
                    child: RawMaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      onPressed: () {},
                      child: Text(
                        'Reset',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      fillColor:Color(0xFFFF9000),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 80,
                    child: RawMaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      onPressed: () {},
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      fillColor: Color(0xFFFF9000),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
