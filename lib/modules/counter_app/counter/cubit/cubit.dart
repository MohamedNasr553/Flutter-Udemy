import 'package:flutter_app/modules/counter_app/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super(CounterInitialState());

  int counter = 1;

  static CounterCubit get(context) => BlocProvider.of(context);

  void minus(){
    counter--;
    emit(CounterMinusState(counter));
  }

  void plus(){
    counter++;
    emit(CounterPlusState(counter));
  }
}