import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testt/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyScreen(),
      ),
    );
  }
}

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                if (CounterCubit.get(context).loadingProgress) {
                  return CircularProgressIndicator.adaptive();
                }
                return ElevatedButton(
                  onPressed: () {
                    CounterCubit.get(context).login();
                  },
                  child: Text('login'),
                );
              },
            ),
            Center(
              child: BlocBuilder<CounterCubit, CounterState>(
                builder: ((context, state) {
                  return GestureDetector(
                    onTap: () {
                      CounterCubit.get(context).changeCounter();
                    }, //0
                    child: Text(''),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
