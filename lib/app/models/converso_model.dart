class ConversorModel{

final double real = 1;
final double dolar;
final double doge;
final double xrp;

  ConversorModel(this.dolar, this.doge, this.xrp);


ConversorModel.fromJsom(Map<String, dynamic> json) :
  dolar = double.parse(json['USDBRL']['bid']),
  doge = double.parse(json['DOGEBRL']['bid']),
  xrp =  double.parse(json['XRPBRL']['bid']);


Map<String, dynamic> toJson() => {
  'dolar' : dolar,
  'doge' : doge,
  'xrp' : xrp,
  'real' : real

};


}