import 'package:ejercicio_componentes/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InputsScreen extends StatelessWidget {
   
  const InputsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, dynamic> formValues = {
      'first_name': 'Nestor',
      'last_name': 'Sanchez',
      'email': 'nestorss05@nestoria.ns',
      'password': '123456',
      'role': 'Shotdown'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Inputs y Forms"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInputField(hintText: "Nombre del usuario", labelText: "Nombre", helperText: "Solo letras", formProperty: 'first_name', formValues: formValues,),
                SizedBox(height: 30),
                CustomInputField(hintText: "Apellido del usuario", labelText: "Apellido", helperText: "Solo letras", formProperty: 'last_name', formValues: formValues,),
                SizedBox(height: 30),
                CustomInputField(hintText: "Correo del usuario", labelText: "Correo", teclado: TextInputType.emailAddress, formProperty: 'email', formValues: formValues,),
                SizedBox(height: 30),
                CustomInputField(hintText: "Contraseña", labelText: "Contraseña", isPassword: true, formProperty: 'password', formValues: formValues,),
                SizedBox(height: 30),
                DropdownButtonFormField<String>(
                  items: [
                    DropdownMenuItem(value: "Admin", child: Text("Admin")),
                    DropdownMenuItem(value: "Superuser", child: Text("Superuser")),
                    DropdownMenuItem(value: "Chief", child: Text("Chief")),
                    DropdownMenuItem(value: "Expeditor", child: Text("Expeditor")),
                  ], 
                  onChanged: (value) {
                    formValues['role'] = value ?? 'Shotdown';
                  },
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text("Guardar"))
                  ),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());

                    if (!myFormKey.currentState!.validate()) {
                      print("Formulario no valido");
                      return;
                    }
                    print(formValues);
                  },
                )
              ],
            ),
          )
        ),
      )
    );
  }
}