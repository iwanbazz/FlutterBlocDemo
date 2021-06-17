import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v611_demo/bloc/counter_bloc.dart';

import 'number_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Bloc Demo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (_, state) => NumberCard("Bloc\nBuilder", (state is CounterValue) ? state.value : 0),
                ),
                SizedBox(
                  width: 40,
                ),
                NumberCard("Watch", 0),
                SizedBox(
                  width: 40,
                ),
                NumberCard("Select", 0),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
                child: Text(
                  'INCREMENT',
                  style: TextStyle(color: Colors.white),
                ),
                shape: StadiumBorder(),
                color: Colors.green[800],
                onPressed: () {
                  context.read<CounterBloc>().add(Increment());
                })
          ],
        ));
  }
}
