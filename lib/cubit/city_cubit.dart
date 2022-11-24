import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:housequ/models/city_model.dart';
import 'package:housequ/services/city_service.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit() : super(CityInitial());

  void fetchCity() async {
    try {
      emit(CityLoading());

      List<CityModel> city = await CityService().fetchCity();

      emit(CitySuccess(city));
    } catch (e) {
      emit(CityFailed(e.toString()));
    }
  }
}
