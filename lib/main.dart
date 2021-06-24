
import 'components/transaction_user.dart';
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Despesas Pessoais'),
        actions:<Widget> [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){},
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
              TransactionUser()
            ]
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){},
          backgroundColor: Colors.greenAccent.shade400,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}