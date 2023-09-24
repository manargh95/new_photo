import 'package:bloc/bloc.dart';
import 'Tabbing_event.dart';
import 'Tabbing_state.dart';

class TabbingBloc extends Bloc<TabbingEvent, TabbingState> {
  TabbingBloc() : super(const LoadPageInitial(tabIndex: 0)) {
    on<TabbingEvent>((event, emit) {
      if (event is TabChange) {
        print(event.tabIndex);
        emit(LoadPageInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
