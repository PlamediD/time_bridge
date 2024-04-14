import 'package:flutter/material.dart';

class AddEventDialog extends StatelessWidget {
  final DateTime selectedDay;
  final void Function(DateTime, String) onEventAdded;

  const AddEventDialog({
    required this.selectedDay,
    required this.onEventAdded,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _eventController = TextEditingController();

    return AlertDialog(
      title: Text('Add Event'),
      content: TextFormField(
        controller: _eventController,
        decoration: InputDecoration(labelText: 'Event Name'),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            String eventName = _eventController.text.trim();
            if (eventName.isNotEmpty) {
              // Call the callback to add the event
              onEventAdded(selectedDay, eventName);
              // Clear the event name field
              _eventController.clear();
              // Close the dialog
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Please enter an event name'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
