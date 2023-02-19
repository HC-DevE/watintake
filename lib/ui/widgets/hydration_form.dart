import 'package:flutter/material.dart';

class HydrationForm extends StatefulWidget {
  final Function(double, String) onSubmit;
  const HydrationForm({super.key, required this.onSubmit});

  @override
  _HydrationFormState createState() => _HydrationFormState();
}

class _HydrationFormState extends State<HydrationForm> {
  final _hydrationController = TextEditingController();
  String _selectedUnit = "ml";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: TextField(
            controller: _hydrationController,
            decoration: InputDecoration(
              hintText: 'Enter water intake',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          flex: 2,
          child: DropdownButtonFormField(
            value: _selectedUnit,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _selectedUnit = value!;
              });
            },
            items: ['ml', 'oz'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: () {
              if (_hydrationController.text.isNotEmpty) {
                double hydration =
                    double.parse(_hydrationController.text.trim());
                if (hydration > 0) {
                  widget.onSubmit(hydration, _selectedUnit);
                  _hydrationController.clear();
                  setState(() {
                    _selectedUnit = "ml";
                  });
                }
              }
            },
            child: Text('Submit'),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _hydrationController.dispose();
    super.dispose();
  }
}
