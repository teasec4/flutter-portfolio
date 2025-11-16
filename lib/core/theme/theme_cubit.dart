import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false); // false = light, true = dark

  void toggleTheme() => emit(!state);
  
  void setDarkTheme(bool isDark) => emit(isDark);
}
