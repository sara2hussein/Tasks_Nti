import 'package:fapp_1/cubit_sebha.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CubitSebha(),
        child: TasbeehPage(),
      ),
    );
  }
}

class TasbeehPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CubitSebha>();

    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text('سبحة إلكترونية'),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CubitSebha, int>(
              builder: (context, count) {
                return Center(
                  child: Text(
                    '$count ',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: cubit.increment,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    backgroundColor: Colors.green[600],
                  ),
                  child: Text('تسبيح', style: TextStyle(fontSize: 20)),
                ),
                SizedBox(width: 30),
                ElevatedButton(
                  onPressed: cubit.reset,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    backgroundColor: Colors.red[400],
                  ),
                  child: Text('إعادة', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
