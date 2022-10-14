import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_rx/get_rx.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:last_ocr/entities/Ocr_pregnant.dart';
import 'package:last_ocr/functions/functions.dart';
import 'package:last_ocr/page/maternity_graph_page.dart';
import 'package:last_ocr/page/maternity_modify_page.dart';
import 'package:last_ocr/page/pregnant_modify_page.dart';
import 'package:path/path.dart';

class MaternitytListPage extends StatefulWidget {

  final List listfromserver_list_mat;
  const MaternitytListPage(this.listfromserver_list_mat);

  @override
  MaternitytListPageState createState() => MaternitytListPageState();

}

class MaternitytListPageState extends State<MaternitytListPage> {

  final List<int> ocr_seq = <int>[];
  final List<String> id = <String>[];
  final List<String> sow_no = <String>[];

  @override
  Widget build(BuildContext context) {

    if(widget.listfromserver_list_mat.isNotEmpty){
      for(int i = 0 ; i < widget.listfromserver_list_mat.length ; i < 0){
        ocr_seq.add(widget.listfromserver_list_mat[i][0]);
        ocr_seq.add(widget.listfromserver_list_mat[i][1]);
        sow_no.add(widget.listfromserver_list_mat[i][2]);

      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text('분만사 기록보기')),
          body: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: ocr_seq.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(

                child: (
                    Stack(
                      children: [
                        for(int i = 0 ; i < ocr_seq.length ; i++)
                          ListTile(
                            title: Text(id[index] + "     " + sow_no[index].toString()),
                            //subtitle: Text(sow_no[index]),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: (){
                              //서버로 선택한 행의 아이디 값을 보냄
                              pregnant_selectrow(ocr_seq[index]);
                              //화면전환코드
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MaternityModifyPage([])));
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