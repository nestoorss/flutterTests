import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_pay_app/bloc/pagar/pagar_bloc.dart';
import 'package:google_pay_app/models/tarjeta_credito.dart';
import 'package:google_pay_app/widgets/widgets.dart';

class TarjetaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final TarjetaCredito tarjeta = context.read<PagarBloc>().state.tarjeta!;

    return Scaffold(
      appBar: AppBar(
        title: Text("Pagar"),
        leading: IconButton(
          onPressed: () {
            context.read<PagarBloc>().add(OnDesactivarTarjeta());
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back_ios)
        ),
      ),
      body: Stack(
        children: [
          Hero (
            tag: tarjeta.cardNumber,
            child: CreditCardWidget(
              cardNumber: tarjeta.cardNumberHidden, 
              expiryDate: tarjeta.expiracyDate, 
              cardHolderName: tarjeta.cardHolderName, 
              cvvCode: tarjeta.cvv, 
              showBackView: false, 
              onCreditCardWidgetChange: (_) {}
            ),
          ),

          Positioned(
            bottom: 0,
            child: TotalPayButton()
          )
        ],
      )
    );
  }
}