import 'package:flutter_bloc/flutter_bloc.dart';

class CubitSebha extends Cubit<int>{
  CubitSebha():super(0);
  void increment(){if(state<33){
    emit(state+1);
  }}
  void reset()=> emit(0);
}