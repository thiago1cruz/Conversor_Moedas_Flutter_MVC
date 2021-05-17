import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyLine extends StatelessWidget {
 final Function convertr;
 final String label;
 final String prefix;
 final TextEditingController control;
 


  CurrencyLine({Key key, this.convertr, this.label, this.prefix, this.control}) : super(key: key);
  
  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
             
              Expanded(
                flex: 3,
                child: TextField(                  
                  decoration: InputDecoration(
                    labelText: label,  
                    prefixText: prefix
                                       
                  ),
                  style: TextStyle(
                    fontSize: 30.0
                  ),
                  controller: control,
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  keyboardType: TextInputType.number,
                  onChanged: convertr,           
                ),
              )
            ],
          ),
        ),
      );
}
