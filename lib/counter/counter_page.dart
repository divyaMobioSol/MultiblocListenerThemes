import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_provider/bloc/appBar/appBar_bloc.dart';
import 'package:multi_bloc_provider/bloc/appBar/appBar_state.dart';
import 'package:multi_bloc_provider/bloc/counter/counter_state.dart';
import 'package:multi_bloc_provider/bloc/theme/theme.state.dart';

import '../bloc/counter/counter_bloc.dart';
import '../bloc/theme/theme.bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CounterCubit, CounterLoading>(listener: (context, state) {
          if (state.counter == 3) {
            BlocProvider.of<ThemeCubit>(context).darkTheme();
          } else {
            BlocProvider.of<ThemeCubit>(context).lightTheme();
          }
        }),
        BlocListener<CounterCubit, CounterLoading>(listener: (context, state) {
          if (state.counter == 5) {
            BlocProvider.of<ThemeCubit>(context).floatingbuttoncolor();
          }
        }),
        BlocListener<CounterCubit, CounterLoading>(listener: (context, state) {
          if (state.counter == 5) {
            BlocProvider.of<AppBarCubit>(context).purpleColor();
          } else if (state.counter == 2) {
            BlocProvider.of<AppBarCubit>(context).amberColor();
          } else {
            BlocProvider.of<AppBarCubit>(context).GreenColor();
          }
        })
      ],
      child: BlocBuilder<AppBarCubit, AppBarState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                backgroundColor: state.color, title: const Text('Counter')),
            body: BlocConsumer<CounterCubit, CounterLoading>(
              listener: (context, state) {
                if (state.counter!.isEven) {
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text('Number is even'),
                    duration: Duration(seconds: 3),
                  ));
                } else {
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text('Number is odd'),
                    duration: Duration(seconds: 3),
                  ));
                }
              },
              builder: (context, state) {
                return Center(
                  child: Text(state.counter.toString(),
                      style: Theme.of(context).textTheme.headline1),
                );
              },
            ),
            floatingActionButton: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () => context.read<CounterCubit>().increment(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: FloatingActionButton(
                    child: const Icon(Icons.remove),
                    onPressed: () => context.read<CounterCubit>().decrement(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: FloatingActionButton(
                      child: const Icon(Icons.brightness_6),
                      onPressed: () {
                        print('Button Pressed');

                        context.read<ThemeCubit>().toggleTheme();
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
