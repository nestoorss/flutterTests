import 'package:bloc/bloc.dart';
import 'package:google_pay_app/models/tarjeta_credito.dart';
import 'package:meta/meta.dart';

part 'pagar_event.dart';
part 'pagar_state.dart';

class PagarBloc extends Bloc<PagarEvent, PagarState> {
  PagarBloc() : super(PagarState()) {
    on<OnSeleccionarTarjeta>((event, emit) {
      state.copyWith(tarjetaActiva: true, tarjeta: event.tarjeta);
    });
    on<OnDesactivarTarjeta>((event, emit) {
      state.copyWith(tarjetaActiva: false);
    });
  }
}
