import 'package:flutter/material.dart';
import 'package:flutter_app/modules/counter_app/counter/cubit/cubit.dart';
import 'package:flutter_app/modules/counter_app/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state){

        },
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                title: const Text('Counter Screen'),
              ),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        CounterCubit.get(context).minus();
                      },
                      child: const Text(
                        'MINUS',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Text(
                        '${CounterCubit.get(context).counter}',
                        style: const TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        CounterCubit.get(context).plus();
                      },
                      child: const Text(
                        'PLUS',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}

