import 'package:flutter/material.dart';


class SegonFormulari extends StatefulWidget {
  const SegonFormulari({Key? key}) : super(key: key);
  @override
  State<SegonFormulari> createState() {
    return _SegonFormulariState();
  }
}

class _SegonFormulariState extends State<SegonFormulari> {
  int currentStep = 0;
  bool isCompleted = false;

  final age = TextEditingController();
  final gender = TextEditingController();
  final nationality = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final mobileNo = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Aurora Herrero Juarez"),
          centerTitle: true,
        ),
        body: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.blue),
          ),
          child: Stepper(
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () {
              final isLastStep = currentStep == getSteps().length - 1;
              if (isLastStep) {
                setState(() => isCompleted = true);
                print('Completed');
              } else {
                setState(() => currentStep += 1);
              }
            },
            onStepTapped: (step) => setState(() => currentStep = step),
            onStepCancel: currentStep == 0
                ? null
                : () => setState(() => currentStep -= 1),
            controlsBuilder:
                (BuildContext context, ControlsDetails controlsDetails) {
              final isLastStep = currentStep == getSteps().length - 1;
              return Container(
                margin: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controlsDetails.onStepContinue,
                        child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    if (currentStep != 0)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: controlsDetails.onStepCancel,
                          child: const Text('BACK'),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      );
  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text('Personal'),
          content: Column(
            children: <Widget>[
              TextFormField(
                controller: age,
                decoration: const InputDecoration(labelText: 'Age'),
              ),
              TextFormField(
                controller: gender,
                decoration: const InputDecoration(labelText: 'Gender'),
              ),
              TextFormField(
                controller: nationality,
                decoration: const InputDecoration(labelText: 'Nationality'),
              )
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text('Contact'),
          content: Column(
            children: <Widget>[
              TextFormField(
                controller: email,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: address,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              TextFormField(
                controller: mobileNo,
                decoration: const InputDecoration(labelText: 'Mobile No'),
              )
            ],
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text('Upload'),
          content: const Column(
            children: <Widget>[],
          ),
        ),
      ];
}