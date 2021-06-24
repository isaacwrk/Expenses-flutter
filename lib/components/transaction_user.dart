import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';
import 'dart:math';

class  TransactionUser extends StatefulWidget {
  
  @override
  _State createState() => _State();
}

class _State extends State<TransactionUser> {
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
    Transaction(
      id:'t3',
      title: 'Camiseta adidas',
      value:80.50,
      date: DateTime.now(),
    ),
    Transaction(
      id:'t3',
      title: 'iphone 11',
      value:8000,
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
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(_addTransaction)
      ],
    );
  }
}