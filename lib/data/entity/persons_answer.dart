
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';

class PersonsAnswer {
  List<Kisiler> kisiler;
  int success;

  PersonsAnswer({required this.kisiler,required  this.success});

  factory PersonsAnswer.fromJson(Map<String, dynamic> json){
    var jsonArry = json["kisiler"] as List;
    int success = json["success"] as int;

    var kisiler = jsonArry.map((jsonArryNesnesi) => Kisiler.fromJson(jsonArryNesnesi)).toList();
    return PersonsAnswer(kisiler: kisiler, success: success);
  }

}