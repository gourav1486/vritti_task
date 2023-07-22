import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vritti_task/business_logic/bloc/get_employee_data_from_local_storage/get_employee_list_from_local_storage_bloc.dart';
import 'package:vritti_task/business_logic/bloc/get_employee_list_from_api/get_employee_list_from_api_bloc.dart';
import 'package:vritti_task/business_logic/bloc/show_details_bloc/show_details_bloc_bloc.dart';
import 'package:vritti_task/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
       BlocProvider<GetEmployeeListFromApiBloc>(
          create: (context) => GetEmployeeListFromApiBloc(),
        ),
         BlocProvider<GetEmployeeListFromLocalStorageBloc>(
          create: (context) => GetEmployeeListFromLocalStorageBloc(),
        ),
          BlocProvider<ShowDetailsBlocBloc>(
          create: (context) => ShowDetailsBlocBloc(),
        ),
    ], child:  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ));
  }
}

