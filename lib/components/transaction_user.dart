import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

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
  ]; 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm()
      ],
    );
  }
}