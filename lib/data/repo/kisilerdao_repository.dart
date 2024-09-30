import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/data/entity/persons_answer.dart';

class KisilerDaoRepository {
  
  List<Kisiler> pasreKisiler(String cevap){
    return PersonsAnswer.fromJson(jsonDecode(cevap)).kisiler;
  }
  
  Future<void> kaydet(String kisi_ad,String kisi_tel) async {
    var url = "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php";
    var veri = {"kisi_ad" : kisi_ad, "kisi_tel": kisi_tel};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    print("Kisi kayit test ${cevap.data.toString()}");
  }

  Future<void> guncelle(int kisi_id,String kisi_ad,String kisi_tel) async {
    var url = "http://kasimadalan.pe.hu/kisiler/update_kisiler.php";
    var veri = {"kisi_id" : kisi_id, "kisi_ad" : kisi_ad, "kisi_tel": kisi_tel};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    print("Kisi guncelle test ${cevap.data.toString()}");
  }

  Future<void> sil(int kisi_id) async {
    var url = "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php";
    var veri = {"kisi_id" : kisi_id};
    var cevap = await Dio().delete(url,data: FormData.fromMap(veri));
    print("Kisi silme test ${cevap.data.toString()}");
  }

  Future<List<Kisiler>> kisileriYukle() async {
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php";
    var cevap = await Dio().get(url);
    return pasreKisiler(cevap.data.toString());
  }

  Future<List<Kisiler>> ara(String aramaKelimesi) async {
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php";
    var veri = {"kisi_ad" : aramaKelimesi};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    return pasreKisiler(cevap.data.toString());

  }
}