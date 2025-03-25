import 'package:flutter/material.dart';
import 'package:preferencias/providers/theme_provider.dart';
import 'package:preferencias/shared/preferences.dart';
import 'package:preferencias/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
   
  static String routeName = "Settings";

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings")
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Settings", style: TextStyle(
                fontSize: 45, fontWeight: FontWeight.w300
              )),
              const Divider(),
              SwitchListTile.adaptive(
                value: Preferences.isDarkmode, 
                title: const Text("Darkmode"),
                onChanged: (value) {
                  Preferences.isDarkmode = value;
                  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                  value ? themeProvider.setDarkmode(): themeProvider.setLightMode();
                  setState((){});
                }
              ),
              const Divider(),
              RadioListTile<int>(
                value: 1,
                groupValue: Preferences.gender,
                title: Text("Masculino"),
                onChanged: (value) {
                  Preferences.gender = value ?? 1;
                  setState((){});
                }
              ),
              const Divider(),
              RadioListTile<int>(
                value: 2,
                groupValue: Preferences.gender,
                title: Text("Femenino"),
                onChanged: (value) {
                  Preferences.gender = value ?? 1;
                  setState((){});
                }
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences.name,
                  onChanged: (value) {
                    Preferences.name = value;
                    setState((){});
                  },
                  decoration: const InputDecoration(
                    labelText: "Nombre",
                    helperText: "Nombre del usuario"
                  ),
                ),
              )
            ],
          )
        ),
      )
    );
  }
}