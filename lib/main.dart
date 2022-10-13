import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_rx/get_rx.dart';
import 'package:last_ocr/entities/Ocr_pregnant.dart';
import 'package:last_ocr/functions/functions.dart';
import 'package:last_ocr/page/Maternity_list_page.dart';
import 'package:last_ocr/page/Pregnant_list_page.dart';
import 'package:last_ocr/page/maternity_graph_page.dart';
import 'package:last_ocr/page/maternity_modify_page.dart';
import 'package:last_ocr/page/maternity_page.dart';
import 'package:last_ocr/page/pregnant_graph_page.dart';
import 'package:last_ocr/page/pregnant_page.dart';
import 'package:last_ocr/entities/Ocr_pregnant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //   title: 'OCR',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      title: 'Flutter Demo',
      home: MyHomePage(),

    );
  }
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("임신사")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: <Widget>[
                      OutlinedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => PregnantPage()));
                          },
                          child: const Text('OCR')
                      ),
                      OutlinedButton(
                          onPressed: (){
                            //서버로부터 값 받아오기
                           // List<String> ocr_seq_sow_no = <String>[];

                            //ocr_seq_sow_no = pregnant_getocr();
                            //화면전환
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => PregnantListPage(ocr_seq_sow_no)));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PregnantListPage()));

                          },
                          child: const Text('기록')
                      ),
                      OutlinedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>  PregnantGraphPage()));
                          },
                          child: const Text('그래프')
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("분만사")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      OutlinedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => MaternityPage()));
                          },
                          child: const Text('OCR')
                      ),
                      OutlinedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => MaternitytListPage()));
                          },
                          child: const Text('기록')
                      ),
                      OutlinedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => MaternityGraphPage()));
                          },
                          child: const Text('그래프')
                      ),
                    ],
                  ),
                ]
            )
        )
    );
  }
}
