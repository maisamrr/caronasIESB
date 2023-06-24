import 'package:caronapp/const.dart';
import 'package:flutter/material.dart';

class KmFormField extends FormField<int> {
  final BuildContext context;
  final String labelText;
  final TextInputType keyboardType;
  final Color backgroundColor;
  final Function(String)? onSubmitted;

  KmFormField({
    Key? key,
    required this.context,
    required this.labelText,
    required this.keyboardType,
    required this.backgroundColor,
    this.onSubmitted,
    int? initialValue,
    FormFieldSetter<int>? onSaved,
  }) : super(
          key: key,
          initialValue: initialValue ?? 0,
          onSaved: onSaved,
          builder: (FormFieldState<int> state) {
            final TextEditingController controller =
                TextEditingController(text: state.value.toString());
            return Padding(
              padding:
                  const EdgeInsets.only(top: 24.0, left: 40.0, right: 40.0),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                child: InkWell(
                  onTap: () async {
                    final int? selectedNumber = await showDialog<int>(
                      context: context,
                      builder: (BuildContext context) {
                        return NumberPickerDialog(
                          initialNumber: state.value!,
                        );
                      },
                    );
                    if (selectedNumber != null) {
                      state.didChange(selectedNumber);
                      controller.text = selectedNumber.toString();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 8.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        //LABEL
                        Expanded(
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                labelText,
                                style:
                                    TextStyle(
                                  color:
                                      Colors.black,
                                  fontSize:
                                      16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //ICONE
                        Container(
                          margin:
                              const EdgeInsets.only(right: 8.0),
                          decoration:
                              BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(5),
                            color:
                                redIdColor,
                          ),
                          child:
                              Padding(
                            padding:
                                EdgeInsets.all(8.0),
                            child:
                                Text(
                              '${state.value} km',
                              style:
                                  TextStyle(
                                color:
                                    Colors.white,
                                fontSize:
                                    16.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
}

class NumberPickerDialog extends StatefulWidget {
  final int initialNumber;

  const NumberPickerDialog({Key? key, required this.initialNumber})
      : super(key: key);

  @override
  _NumberPickerDialogState createState() => _NumberPickerDialogState();
}

class _NumberPickerDialogState extends State<NumberPickerDialog> {
  late int selectedNumber;

  @override
  void initState() {
    super.initState();
    selectedNumber = widget.initialNumber;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Escolha um número'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            for (int i = 1; i <= 10; i++)
              ListTile(
                title: Text(i.toString()),
                onTap: () {
                  setState(() {
                    selectedNumber = i;
                  });
                },
                trailing: selectedNumber == i
                    ? Icon(Icons.check)
                    : null,
              ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('SAIR'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop(selectedNumber);
          },
        ),
      ],
    );
  }
}