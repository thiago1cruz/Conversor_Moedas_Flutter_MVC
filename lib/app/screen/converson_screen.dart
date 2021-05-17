import 'package:conversor/app/components/currency_line.dart';
import 'package:conversor/app/controllers/conrsion_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeConversor extends StatefulWidget {
  @override
  State<HomeConversor> createState() => _HomeState();
}

class _HomeState extends State<HomeConversor> {
  final contoller = ConversionCotroller();

  _sucess() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: AlignmentDirectional.topCenter,
            child: Icon(
              Icons.monetization_on_outlined,
              size: 100,
              color: Colors.amber,
            ),
          ),
          CurrencyLine(
            label: 'Real',
            prefix: 'R\$: ',
            convertr: contoller.converterReal,
            control: contoller.real,
          ),
          CurrencyLine(
            label: 'Dolar',
            prefix: 'USD\$: ',
            convertr: contoller.converterDol,
            control: contoller.dol,
          ),
          CurrencyLine(
            label: 'Ripple',
            prefix: 'XRP\$: ',
            convertr: contoller.converterXrp,
            control: contoller.xrp,
          ),
          CurrencyLine(
            label: 'Dogecoin',
            prefix: 'DOGE\$: ',
            convertr: contoller.converterDoge,
            control: contoller.doge,
          ),
        ],
      ),
    );
  }

  _error() {
    return Container(
      alignment: AlignmentDirectional.center,
      child: RaisedButton(
        onPressed: () {
          contoller.init();
        },
        child: Text("Tentar Novamente"),
      ),
    );
  }

  _start() {
    return Container();
  }

  _loading() {
    return Container(
      alignment: AlignmentDirectional.center,
      child: CircularProgressIndicator(),
    );
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.error:
        return _error();
        break;
      case HomeState.loading:
        return _loading();
        break;
      case HomeState.start:
        return _start();
        break;
      case HomeState.sucess:
        return _sucess();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    contoller.init();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("Conversor"),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh_outlined),
              onPressed: () {
                contoller.init();
                contoller.converterReal(contoller.real.text);               
              }),
              RaisedButton(
                onPressed: () { 
                  contoller.limparCampos();
                 },
                child: Text('Limpar'),
              )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: AnimatedBuilder(
            animation: contoller.state,
            builder: (BuildContext context, Widget child) {
              return stateManagement(contoller.state.value);
            },
          ),
        ),
      ));
}
