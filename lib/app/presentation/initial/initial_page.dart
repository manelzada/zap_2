import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:zap_2/app/application/initial/initial_page_store.dart';
import 'package:zap_2/app/domain/functions/validate_name.dart';
import 'package:zap_2/app/presentation/components/custom_button_component.dart';
import 'package:zap_2/app/presentation/components/custom_text_formfield_component.dart';
import 'package:zap_2/app/presentation/components/snack_bar_error.dart';
import 'package:zap_2/app/presentation/components/snack_bar_success.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Observer(builder: (_) {
              return CustomTextFormFieldComponent(
                label: 'Nome de usuário',
                textInputType: TextInputType.name,
                textEditingController: _nameEditingController,
                onChange: (value) => controller.changeErrorName(null),
              );
            }),
            const SizedBox(height: 25),
            CustomButtonComponent(
              label: 'Entrar',
              onPressed: _entrar,
            )
          ],
        ),
      ),
    );
  }

  void _entrar() {
    String name = _nameEditingController.text;
    if (_validate(name: name)) {
      showSnackbarSucess('Dale, entrosa aí faz favor', context);
      Navigator.pushNamed(context, '/loading', arguments: name);
    } else {
      showSnackbarError('Digite um nome válido faz favor', context);
    }
  }

  bool _validate({required String name}) {
    var responseName = validateName(name);
    controller.changeErrorName(responseName);
    return responseName == null;
  }
}
