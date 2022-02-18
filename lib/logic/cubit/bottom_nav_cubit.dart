import 'package:flutter_bloc/flutter_bloc.dart';


class BottomNavCubit extends Cubit<int> {
  void onTapIconPage(int index)=>  emit(index);
  BottomNavCubit() : super(0);
}