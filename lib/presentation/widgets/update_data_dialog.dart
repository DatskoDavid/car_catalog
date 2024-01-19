import 'package:flutter/material.dart';

class UpdateDataDialog extends StatefulWidget {
  const UpdateDataDialog({
    Key? key,
    required this.elementId,
    required this.data,
    required this.updateData,
  }) : super(key: key);

  final String elementId;
  final String data;
  final Function(String, String) updateData;

  @override
  State<UpdateDataDialog> createState() => _UpdateDataDialogState();
}

class _UpdateDataDialogState extends State<UpdateDataDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool wordIsCorrect = true;
  String incorrectWord = '';

  @override
  Widget build(BuildContext context) {
    final TextEditingController _dataController =
        TextEditingController(text: widget.data);
    return AlertDialog(
      title: const Text('Input data'),
      content: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: TextFormField(
          controller: _dataController,
          decoration: InputDecoration(
            hintText: 'Enter here...',
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            } else {
              return null;
            }
          },
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 66, 143, 68),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    widget.updateData(widget.elementId, _dataController.text);
                    Navigator.pop(context);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Update',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
