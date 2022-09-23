// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'base_view.dart';

enum State {
  OK,
  ERROR,
  LOADING
}

///
/// --------------------------------------------
/// There are several [State]s in this class.
/// The [Function]s and [State]s in this class are only to be used in classes that extend in [BaseViewModel].
/// You can find and use on your Controller wich is the Controller extends [BaseController].
class WidgetState {
  final Rx<State> _widgetState = State.LOADING.obs;
  Rx<State> stateLoading = State.LOADING.obs;
  Rx<State> stateOk = State.OK.obs;
  Rx<State> stateError = State.ERROR.obs;

  Rx<State> get getWiState => _widgetState;

  set setWiState(Rx<State> event) => _widgetState.value = event.value;

  bool get wiStateIsLoading => _widgetState.value == stateLoading.value;

  bool get wiStateIsOK => _widgetState.value == stateOk.value;
  
  bool get wiStateIsError => _widgetState.value == stateError.value;

}


///
/// --------------------------------------------
/// There are several [State]s in this class.
/// The [Function]s and [State]s in this class are only to be used in classes that extend in [BaseView].
/// You can find and use on your Controller wich is the Controller extends [BaseController].
class ScreenState {
  State _screenState = State.LOADING;
  State screenStateLoading = State.LOADING;
  State screenStateOk = State.OK;
  State screenStateError = State.ERROR;

  State get getScreenState => _screenState;

  set setScreenState(State event) => _screenState = event;

  bool get screenStateIsLoading => _screenState == screenStateLoading;

  bool get screenStateIsOK => _screenState == screenStateOk;

  bool get screenStateIsError => _screenState == screenStateError;
}