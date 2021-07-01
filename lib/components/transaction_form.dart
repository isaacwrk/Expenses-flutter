

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  
  final void Function(String,double,DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
   DateTime ?selectedDate;

    _submitForm(){

          final title =  titleController.text;
          final value = double.tryParse(valueController.text) ?? 0.0;
          if(title.isEmpty || value <= 0){
            return;
          }
          widget.onSubmit(title,value,selectedDate!);
    }


  _showDatePicker(){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate){
      if(pickedDate == null){
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
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
                        Expanded(
                            child: Text(
                            selectedDate == null ? 'Nenhuma data selecionada!'
                            : 'Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate!)}',
                            ),
                        ),
                        FlatButton(
                          textColor: Theme.of(context).primaryColor,
                          child: Text('Selecionar Data',style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          onPressed:  _showDatePicker,
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