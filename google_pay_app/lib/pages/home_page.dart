import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_pay_app/bloc/pagar/pagar_bloc.dart';
import 'package:google_pay_app/data/tarjetas.dart';
import 'package:google_pay_app/helpers/helpers.dart';
import 'package:google_pay_app/pages/pages.dart';
import 'package:google_pay_app/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Pagar"),
        actions: [
          IconButton(
            onPressed: () async {
              mostrarLoading(context);
              await Future.delayed(Duration(seconds: 1));
              Navigator.pop(context);
              mostrarAlerta(context, "Hola", "Mundo");
            }, 
            icon: Icon(Icons.add)
          )
        ]
      ),
      body: Stack(
        children: [
          Positioned(
            width: size.width,
            height: size.height,
            top: 200,
            child: PageView.builder(
              controller: PageController(
                viewportFraction: 0.9
              ),
              physics: BouncingScrollPhysics(),
              itemCount: tarjetas.length,
              itemBuilder: (_, i) {
                final tarjeta = tarjetas[i];
                return GestureDetector (
                  onTap: () {
                    context.read<PagarBloc>().add(OnSeleccionarTarjeta(tarjeta));
                    Navigator.push(context, navegarFadeIn(context, TarjetaPage()));
                  },
                  child: Hero (
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
                );
              },
            )
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