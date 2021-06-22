import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main()=>runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {
  
  final _transactions = [
    Transaction(
      id:'t1',
      title: 'Novo Tênis de Corrida',
      value:310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id:'t2',
      title: 'Conta de água',
      value:140.43,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Despesas Pessoais')
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child:Text('Gráfico'),
                elevation: 5,
                ),
            ),
            Column(
              children:_transactions.map((tr) {
                  return Card(
                    child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal:15,
                              vertical:10
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.greenAccent,
                                width: 2,
                              )
                            ),
                            padding:EdgeInsets.all(10) ,
                            child: Text(
                              'R\$ ${tr.value.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.greenAccent.shade400
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tr.title,
                                style: TextStyle(
                                  fontSize:16,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                              Text(
                                tr.date.toString(),
                                style:TextStyle(
                                  color:Colors.grey[600]
                                )
                                )
                            ],
                          )
                        ],
                    ),
                    );
              }).toList(),
            )
          ]
        ),
    );
  }
}