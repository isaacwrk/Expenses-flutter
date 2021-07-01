

import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  
  final void Function(String,double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

    _submitForm(){

          final title =  titleController.text;
          final value = double.tryParse(valueController.text) ?? 0.0;
          if(title.isEmpty || value <= 0){
            return;
          }
          widget.onSubmit(title,value);
    }

  @override
  Widget build(BuildContext context) {
   return Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children:[
                    TextField(
                      controller: titleController,
                      onSubmitted: (value)=>_submitForm(),
                      decoration: InputDecoration(
                        labelText: 'Título',
                      ),
                    ),
                    TextField(
                        controller: valueController,
                        keyboardType: TextInputType.number,
                        onSubmitted: (value)=>_submitForm(),
                        decoration: InputDecoration(
                        labelText: 'Valor(R\$)',
                      )
                    ),
                    Container(
                      height: 70,
                      child: Row
                      (children: [
                        Text('Nenhuma data selecionada!'),
                        FlatButton(
                          textColor: Theme.of(context).primaryColor,
                          child: Text('Selecionar Data',style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          onPressed: (){},
                        )
                      ],),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RaisedButton(
                          child: Text('Nova Transação', style: TextStyle(fontWeight: FontWeight.bold),),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: _submitForm,
                        ),
                      ],
                    )
                  ]
                ),
              ),
            );
  }
}