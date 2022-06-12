import 'package:bloc/bloc.dart';
import 'package:multi_bloc_provider/bloc/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterLoading> {
  CounterCubit() : super(CounterLoading(counter: 0));

  void increment() => emit(counterIncrement(counter: state.counter! + 1));
  void decrement() => emit(counterDecrement(counter: state.counter! - 1));
}
