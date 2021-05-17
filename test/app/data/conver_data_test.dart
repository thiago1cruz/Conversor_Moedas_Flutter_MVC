import 'package:conversor/app/data/conver_data.dart';
import 'package:flutter_test/flutter_test.dart';

  main() {

    final  teste = ConversorData();
    test("Teste Busca de dados na internet", () async{

        
       final moeda = await teste.getData();
        
       expect(5.2693, moeda.dolar);

       
    });
    
  }
