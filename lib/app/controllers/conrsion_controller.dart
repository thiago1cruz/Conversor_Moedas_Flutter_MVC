


import 'package:conversor/app/data/conver_data.dart';
import 'package:conversor/app/models/converso_model.dart';
import 'package:flutter/cupertino.dart';

class ConversionCotroller{

   final state  = ValueNotifier<HomeState>(HomeState.start);

   final real = TextEditingController() ;
   final doge = TextEditingController() ;
   final xrp = TextEditingController() ;
   final dol = TextEditingController();

    final data = ConversorData();
    ConversorModel moedas;

    Future init() async{
      state.value = HomeState.loading;
     try {
        moedas = await data.getData();
        state.value = HomeState.sucess;          
     } catch (e) {
       state.value = HomeState.error;
     }
      
    }

    void converterReal(String text){
      if (text.isEmpty){
        limparCampos();
    }
     doge.text = ((double.parse(text))/moedas.doge).toStringAsFixed(2);
     xrp.text = ((double.parse(text))/moedas.xrp).toStringAsFixed(2);
     dol.text = ((double.parse(text))/moedas.dolar).toStringAsFixed(2);
     
    }
    void converterDoge(String text){
       if (text.isEmpty){
        limparCampos();
    }
     double convert_real = (moedas.doge*double.parse(text));
     real.text = (convert_real).toStringAsFixed(2);
     xrp.text = (convert_real/moedas.xrp).toStringAsFixed(2);
     dol.text = (convert_real/moedas.dolar).toStringAsFixed(2);
    
    }
    void converterXrp(String text){
       if (text.isEmpty){
        limparCampos();
    }
    double convert_real = (moedas.xrp*double.parse(text));
     doge.text = (convert_real/moedas.doge).toStringAsPrecision(2);
     real.text = (convert_real).toStringAsFixed(2);  
     dol.text = (convert_real/moedas.dolar).toStringAsFixed(2);
    
    }
    void converterDol(String text){
      if (text.isEmpty){
        limparCampos();
    }
    double convert_real = (moedas.dolar*double.parse(text));
     doge.text = (convert_real/moedas.doge).toStringAsPrecision(2);
     real.text = (convert_real).toStringAsFixed(2);  
     xrp.text = (convert_real/moedas.xrp).toStringAsFixed(2);
     
     }  

    void limparCampos(){
        real.text = "";
        dol.text = "";
        doge.text = "";
        xrp.text = "";
    }

}

enum HomeState{
  start, loading, sucess, error
  
}