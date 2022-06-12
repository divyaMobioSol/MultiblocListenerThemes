import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_provider/bloc/appBar/appBar_bloc.dart';
import 'package:multi_bloc_provider/bloc/counter/counter_bloc.dart';
import 'package:multi_bloc_provider/bloc/theme/theme.bloc.dart';
import 'package:multi_bloc_provider/bloc/theme/theme.state.dart';
import 'package:multi_bloc_provider/counter/counter_page.dart';

//With Bloc
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => AppBarCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              floatingActionButtonTheme: state.floatingActionButtonThemeData,
              primarySwatch: Colors.teal,
              brightness: state.brightness,
            ),
            home: CounterPage(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
