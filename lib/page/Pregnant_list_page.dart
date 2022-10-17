import 'dart:convert';

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

  // PregnantListPage(List list_ocr_seq);
  final List<dynamic> listfromserver_list_pre ;
  const PregnantListPage(this.listfromserver_list_pre);

  @override
  PregnantListPageState createState() => PregnantListPageState();
}

class PregnantListPageState extends State<PregnantListPage> {

  final List<int> ocr_seq = <int>[];
  //final List<String> id = <String>[];
  final List<String> sow_no = <String>[];
  int num  = 0;

  @override
  Widget build(BuildContext context) {

    num = widget.listfromserver_list_pre[0][0];
    // num2 = widget.listfromserver_list_pre[1][0];


    // if(widget.listfromserver_list_pre.isNotEmpty){
    //   for(int i = 1 ; i < num ; i < 0) {
    //     ocr_seq.add(widget.listfromserver_list_pre[i][0]);
    //     sow_no.add(widget.listfromserver_list_pre[i][1]);
    //   }
    //   print("ocr_seq : " + ocr_seq.toString());
    //   print("sow_no: " + sow_no.toString());
    // }

    for(int i = 1; i < num + 1 ; i ++) {
      ocr_seq.add(widget.listfromserver_list_pre[i][0]);
      sow_no.add(widget.listfromserver_list_pre[i][1]);
    }
    // print(ocr_seq);
    // print(sow_no);


    return Scaffold(
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
                          title: Text("모돈 번호 :" + sow_no[index]),
                          //subtitle: Text(sow_no[index]),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () async {
                            print(ocr_seq[index].toString());
                            //pregnant_selectrow(ocr_seq[index].toString());
                            //서버로 사용자가 선택한 리스트 값을 보냄
                            List list = await pregnant_selectrow(ocr_seq[index]);

                            print("리스트 페이지임");
                            print(list);



                            //화면전환코드
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PregnantModifyPage(list)));
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
    );
  }
}