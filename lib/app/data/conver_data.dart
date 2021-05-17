




import 'package:conversor/app/models/converso_model.dart';
import 'package:dio/dio.dart';

class ConversorData{

  final String path = "https://economia.awesomeapi.com.br/json/last/USD-BRL,DOGE-BRL,XRP-BRL";

Future<ConversorModel> getData() async {
  var dio = Dio();
  final Response response = await dio.get(path);
  final moeda = ConversorModel.fromJsom(response.data);
  return moeda;
}  




}