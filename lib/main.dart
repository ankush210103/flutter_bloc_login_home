import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app_routes.dart';
import 'logic/login_bloc/login_bloc.dart';
import 'logic/photo_bloc/photo_bloc.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/photo_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository = AuthRepository();
  final PhotoRepository photoRepository = PhotoRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(authRepository),
        ),
        BlocProvider<PhotoBloc>(
          create: (_) => PhotoBloc(photoRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter BLoC App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.login,
        routes: AppRoutes.routes,
      ),
    );
  }
}
