import 'package:caronapp/const.dart';
import 'package:flutter/material.dart';

class CustomTimePicker extends FormField<TimeOfDay> {
  final BuildContext context;
  final String labelText;
  final TextInputType keyboardType;
  final Color backgroundColor;
  final Function(String)? onSubmitted;

  CustomTimePicker({
    Key? key,
    required this.context,
    required this.labelText,
    required this.keyboardType,
    required this.backgroundColor,
    this.onSubmitted,
    TimeOfDay? initialValue,
    FormFieldSetter<TimeOfDay>? onSaved,
    FormFieldValidator<TimeOfDay>? validator,
  }) : super(
          key: key,
          initialValue: initialValue ?? TimeOfDay.now(),
          onSaved: onSaved,
          validator: validator,
          builder: (FormFieldState<TimeOfDay> state) {
            final TextEditingController controller =
                TextEditingController(text: state.value!.format(context));
            return Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 40.0, right: 40.0),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: backgroundColor,
                ),
                child: InkWell(
                  onTap: () async {
                    final TimeOfDay? selectedTime = await showTimePicker(
                      context: context,
                      initialTime: state.value!,
                      initialEntryMode: TimePickerEntryMode.input,
                      builder: (BuildContext context, Widget? child) {
                        return MediaQuery(
                          data: MediaQuery.of(context)
                              .copyWith(alwaysUse24HourFormat: true),
                          child: child!,
                        );
                      },
                    );
                    if (selectedTime != null) {
                      state.didChange(selectedTime);
                      controller.text = selectedTime.format(context);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 8.0, top: 8.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Icon(
                            Icons.access_time,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  labelText,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: redIdColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    state.value!.format(context),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
