
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_rx/get_rx.dart';
import 'package:last_ocr/entities/Ocr_pregnant.dart';

//임신사 사진전송
pregnant_insert(String path) async {
  final api = 'http://211.107.210.141:3000/api/ocrImageUpl';
  final data = {
    "ocr_imgpath": path,
  };
  final dio = Dio();
  Response response;
  response = await dio.post(api, data: data);
  if (response.statusCode == 200) {
    resultToast('Ocr 임신사 insert success... \n\n');
  }

}

//전체 기록 불러오기
pregnant_getocr() async {
  var pregnants = <Ocr_pregnant>[].obs;
  late List<String> list_ocr_seq = <String>[];
  late List<String> list_sow_num = <String>[];

  final api ='http://211.107.210.141:3000/api/getOcr_pregnant';
  final dio = Dio();

  print("기록 불러올거임");
  Response response = await dio.get(api);

  if(response.statusCode == 200) {

    List<dynamic> result = response.data;
    pregnants.assignAll(result.map((data) => Ocr_pregnant.fromJson(data)).toList());
    pregnants.refresh();

    print("기록 불러와짐");
    print(pregnants.length);

    for( int i=0; i<pregnants.length; i++){
      print(" success..."+pregnants[i].ocr_seq.toString()+" "+pregnants[i].sow_no.toString());
      list_ocr_seq.add(pregnants[i].ocr_seq.toString());
      list_sow_num.add(pregnants[i].sow_no.toString());
      // return list_sow_num + list_sow_num;
    }
  }else{
    print(" fail..."+response.statusCode.toString());
  }
  return list_ocr_seq + list_ocr_seq;
  //Navigator.pushNamed(context, '/second', arguments: list_sow_num);

}

//선택한 기록 불러오기
//사용자 아이디, 모돈 번호를 보내고 그 값을 받아옴
pregnant_selectrow(int num) async{
  final api ='http://211.107.210.141:3000/api/ocr_pregnantSelectedRow';
  final data = {
    "ocr_seq": num, //pk
  };
  final dio = Dio();
  Response response;
  response = await dio.post(api,data: data);
  if(response.statusCode == 200) {
    print("col 1.."+response.data[0].toString());
    print("col 10.."+response.data[10].toString());
  }else{
    print(" fail..."+response.statusCode.toString());
  }
}

//수정 후 서버 전송
pregnant_update(String? ocr_seq, String? sow_no,String? sow_birth, String? sow_buy, String? sow_estrus, String? sow_cross, String? boar_fir, String? boar_sec,
String? checkdate, String? expectdate, String? vaccine1, String? vaccine2, String? vaccine3, String? vaccine4, String? memo) async {
final api ='http://172.17.53.63:3000/api/ocrpregnatInsert';
final data = {
  "ocr_seq": ocr_seq,
  "sow_no": sow_no,
  "sow_birth": sow_birth,
  "sow_buy":sow_buy,
  "sow_estrus":sow_estrus,
  "sow_cross":sow_cross,
  "boar_fir":boar_fir,
  "boar_sec":boar_sec,
  "checkdate":checkdate,
  "expectdate":expectdate,
  "vaccine1":vaccine1,
  "vaccine2":vaccine2,
  "vaccine3":vaccine3,
  "vaccine4":vaccine4,
  // "ocr_imgpath":'17',
  "memo":memo,
};
final dio = Dio();
Response response;
response = await dio.post(api,data: data);
if(response.statusCode == 200){
//resultToast('Ocr 임신사 update success... \n\n');
print('Ocr 임신사 update success... \n\n');
}
return 0;
}

//분만사 사진전송
maternity_insert(String path) async{
  final api ='http://211.107.210.141:3000/api/home/gfarm/ocrimages';
  final data = {
    "ocr_imgpath":path,
  };
  final dio = Dio();
  Response response;
  response = await dio.post(api,data: data);
  if(response.statusCode == 200){
    resultToast('Ocr 분만사 insert success... \n\n');
  }
}

//분만사 전체 기록 불러오기
maternity_getocr() async {
  var pregnants = <Ocr_pregnant>[].obs;

  final api ='http://211.107.210.141:3000/api/getOcr_maternity';
  final dio = Dio();
  Response response = await dio.get(api);
  if(response.statusCode == 200) {

    List<dynamic> result = response.data;
    pregnants.assignAll(result.map((data) => Ocr_pregnant.fromJson(data)).toList());
    pregnants.refresh();
    for( int i=0; i<pregnants.length; i++){
      print(" success..."+pregnants[i].ocr_seq.toString()+" "+pregnants[i].sow_no.toString());
    }
  }else{
    print(" fail..."+response.statusCode.toString());
  }
}

//선택한 리스트 값 받아오기
maternity_selectrow() async {
  final api ='http://211.107.210.141:3000/api/ocr_maternitySelectedRow';
  final data = {
    "ocr_seq":int.parse('1'),
  };
  final dio = Dio();
  Response response;
  response = await dio.post(api,data: data);
  if(response.statusCode == 200) {
    print("col 1.."+response.data[0].toString());
    print("col 10.."+response.data[10].toString());
  }else{
    print(" fail..."+response.statusCode.toString());
  }
}

//수정 후 서버로 다시 전송
maternity_update(String? sow_no, String? sow_birth, String? sow_buy, String? sow_expectdate, String? sow_givebirth, String? sow_totalbaby, String? sow_feedbaby,
    String? sow_babyweight, String? sow_sevrerdate, String? sow_sevrerqty, String? sow_sevrerweight,  String? vaccine1, String? vaccine2,
    String? vaccine3, String? vaccine4, String? memo) async {
final api ='http://211.107.210.141:3000/api/ocrmaternityUpdate';
final data = {
  "sow_no": sow_no,
  "sow_birth": sow_birth,
  "sow_buy":sow_buy,
  "sow_expectdate":sow_expectdate,
  "sow_givebirth":sow_givebirth,
  "sow_totalbaby":sow_totalbaby,
  "sow_feedbaby":sow_feedbaby,
  "sow_babyweight":sow_babyweight,
  "sow_sevrerdate":sow_sevrerdate, //이유두수
  "sow_sevrerqty":sow_sevrerqty, //이유날
  "sow_sevrerweight":sow_sevrerweight, //이유체중
  "vaccine1": vaccine1,
  "vaccine2": vaccine2,
  "vaccine3": vaccine3,
  "vaccine4":vaccine4,
  // "ocr_imgpath":'14',
  "memo": memo,};
final dio = Dio();
Response response;
response = await dio.post(api,data: data);
if(response.statusCode == 200){
//resultToast('Ocr 분만사 update success... \n\n');
}
}



//Toast 찍기
resultToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      fontSize: 16.0
  );
}

