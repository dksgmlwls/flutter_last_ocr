import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_rx/get_rx.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:last_ocr/entities/Ocr_pregnant.dart';
import 'package:last_ocr/functions/functions.dart';
import 'package:last_ocr/page/maternity_graph_page.dart';
import 'package:last_ocr/page/pregnant_modify_page.dart';
import 'package:path/path.dart';

class PregnantListPage extends StatefulWidget {
  @override
  PregnantListPageState createState() => PregnantListPageState();
}

class PregnantListPageState extends State<PregnantListPage> {

  final List<String> ocr_seq = <String>['A', 'B', 'C'];
  final List<String> sow_no = <String>['100', '500', '100'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('임신사 기록보기')),
          body: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: ocr_seq.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                // height: 50,
                // color: Colors.amber[sow_no[index]],
                // child: Center(child: Text('Entry ${ocr_seq[index]}')),
                child: (
                    Stack(
                      children: [
                        for(int i = 0 ; i < ocr_seq.length ; i++)
                          ListTile(
                            title: Text(ocr_seq[index]),
                            subtitle: Text(sow_no[index]),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: (){
                              //화면전환코드
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PregnantModifyPage()));
                            },
                          ) ,
                        Container(
                          height: 1,
                          color: Colors.black,
                        )
                      ],
                    )
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          )
      ),
    );
  }

}





