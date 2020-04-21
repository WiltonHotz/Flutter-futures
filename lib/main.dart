import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var futureValue = await myTimedOutFuture().timeout(Duration(seconds: 2), onTimeout: () {
              print('This future has been timed out');
              return 'This is my timeout value';
            });

            print('Future complete: $futureValue');
          },
        ),
      ),
    );
  }

  // timeout
  Future<String> myTimedOutFuture() async {
    print('Future started');
    await Future.delayed(Duration(seconds: 5));
    return 'Future complete';
  }



//  // Collection of futures
//  Future<bool> downloadFile(int id, int duration) async {
//    await Future.delayed(Duration(seconds: duration));
//    print('Download complete for $id');
//    return true;
//  }
//
//  Future runMultipleDownloads() async {
//    var futures = List<Future>();
//    for(int i = 0; i < 10; i++) {
//      futures.add(downloadFile(i, Random().nextInt(10)));
//    }
//    print('start downloads');
//    await Future.wait(futures);
//    print('All downloads completed');
//  }

}

