

import 'package:expenses/components/transaction_form.dart';
import './components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';
import 'dart:math';
import 'package:flutter/material.dart';


main()=>runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.red,
        fontFamily: 'QuickSand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6:TextStyle(
              fontFamily:'QuickSand',
              fontSize:20,
              fontWeight: FontWeight.bold
            )
          )
        )
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  _addTransaction(String title, double value){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (_){
        return TransactionForm(_addTransaction);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.greenAccent.shade400,
        title:Text('Despesas Pessoais'),
        actions:<Widget> [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          )
        ],
        ),
        body: SingleChildScrollView(
                  child: Column(
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
              TransactionList(_transactions),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(context),
          backgroundColor: Colors.greenAccent.shade400,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}