import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<EnableDisableNotifications>(_enableDisableNotifications);
    on<SliderEvent>(_sliderEvent);
  }

  void _enableDisableNotifications(
      EnableDisableNotifications events, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _sliderEvent(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}
