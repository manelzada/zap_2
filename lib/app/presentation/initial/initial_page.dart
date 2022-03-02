import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:zap_2/app/application/initial/initial_page_store.dart';
import 'package:zap_2/app/presentation/components/custom_button_component.dart';
import 'package:zap_2/app/presentation/components/custom_text_formfield_component.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends ModularState<InitialPage, InitialPageStore> {
  final _nameEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTextFormFieldComponent(
            label: 'Nome de usuário',
            textInputType: TextInputType.name,
            textEditingController: _nameEditingController,
            onChange: (value) => controller.changeErrorName(null),
          ),
          CustomButtonComponent(
            label: 'Entrar',
            onPressed: _entrar,
          )
        ],
      ),
    );
  }

  void _entrar() {
    String name = _nameEditingController.text;
  }
}
