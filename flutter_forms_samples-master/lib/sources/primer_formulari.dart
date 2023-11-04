import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PrimerFormulari extends StatefulWidget {
  const PrimerFormulari({Key? key}) : super(key: key);

  @override
  State<PrimerFormulari> createState() {
    return _PrimerFormulariState();
  }
}

class _PrimerFormulariState extends State<PrimerFormulari> {
  int? option;

  void _onChanged(dynamic val) => debugPrint(val.toString());

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 15,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Aurora Herrero Juarez"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle('Please provide the speed of vehicle?'),
                  FormBuilderRadioGroup<String>(
                    orientation: OptionsOrientation.vertical,
                    initialValue: null,
                    name: 'velocity',
                    decoration: const InputDecoration(labelText: 'please select one option given below'),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()]),
                    options: ['above 40km/h', 'below 40km/h', '0km/h']
                        .map((lang) => FormBuilderFieldOption(
                              value: lang,
                              child: Text(lang),
                            ))
                        .toList(growable: false),
                    controlAffinity: ControlAffinity.leading,
                  ),
                ],
              ),
              const SizedBox(height: 20),  // Añadir un espacio entre los grupos de widgets
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle('Please provide de high speed of vehicle?'),
                  FormBuilderDropdown<int>(
                    name: 'options',
                    validator: FormBuilderValidators.required(),
                    decoration: const InputDecoration(
                      label: Text('please select one option given below'),
                    ),
                    onChanged: (value) {
                      setState(() {
                        option = value;
                      });
                    },
                    items: const [
                      DropdownMenuItem(value: 0, child: Text('100')),
                      DropdownMenuItem(value: 1, child: Text('120')),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),  // Añadir un espacio entre los grupos de widgets
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle('Please provide the speed of vehicle past 1 hour?'),
                  FormBuilderCheckboxGroup<String>(
                    orientation: OptionsOrientation.vertical,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: 'please select one or more options given below',
                    ),
                    name: 'selectoption',
                    options: const [
                      FormBuilderFieldOption(value: '20km/h'),
                      FormBuilderFieldOption(value: '30km/h'),
                      FormBuilderFieldOption(value: '40km/h'),
                      FormBuilderFieldOption(value: '50km/h'),
                    ],
                    onChanged: _onChanged,
                    separator: const VerticalDivider(
                      width: 10,
                      thickness: 5,
                      color: Colors.red,
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.minLength(1),
                      FormBuilderValidators.maxLength(1),
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}