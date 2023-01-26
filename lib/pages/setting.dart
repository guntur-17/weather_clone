import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:openweather_app/pages/home.dart';
import 'package:openweather_app/services/current.service.dart';
import 'package:openweather_app/services/three_hours_five_days.service.dart';
import 'package:openweather_app/widgets/setting_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final title = ['Different Weather?', 'Customize Unit'];

    Widget body() {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: title.length,
                itemBuilder: (context, index) {
                  final _title = title[index];
                  return SettingWidget(title: _title);
                },
              )
            ],
          ),
        ),
      );
    }

    // Widget apiButtonTest() {
    //   return Padding(
    //     padding: const EdgeInsets.all(20.0),
    //     child: SizedBox(
    //       width: 100,
    //       child: ElevatedButton(
    //           onPressed: () async {
    //             Navigator.pushAndRemoveUntil(
    //                 context,
    //                 MaterialPageRoute(builder: (context) => HomePage()),
    //                 (route) => false);
    //             // await ThreeHFiveDServices.getThreeHFiveD(
    //             //     lat: -6.274444184597403, long: 106.7345713873699);
    //           },
    //           child: const Text('GET')),
    //     ),
    //   );
    // }

    // Widget apiButtonTestCurrent() {
    //   return SizedBox(
    //     width: 100,
    //     child: ElevatedButton(
    //         onPressed: () async {
    //           await CurrentServices.getCurrent(
    //               lat: -6.274444184597403, long: 106.7345713873699);
    //         },
    //         child: const Text('GET')),
    //   );
    // }

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: [
            body(),
            // apiButtonTest(),
            // apiButtonTestCurrent(),
          ],
        ),
      ),
    ));
  }
}
