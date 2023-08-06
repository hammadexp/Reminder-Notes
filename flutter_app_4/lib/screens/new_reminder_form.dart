import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app_4/cubits/new_reminder_cubit.dart';
import 'package:flutter_app_4/models/reminder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewReminderForm extends StatefulWidget {
  const NewReminderForm({super.key});

  @override
  State<NewReminderForm> createState() => _NewReminderFormState();
}

class _NewReminderFormState extends State<NewReminderForm> {
  final List<bool> _selectedPriority = <bool>[true, false, false];
   TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  String _title = '';
  String _content = '';
  @override
  Widget build(BuildContext context) {
    final reminderCubit = BlocProvider.of<NewReminderCubit>(context);
    const List<Widget> priority = <Widget>[
      Text('Low'),
      Text('Medium'),
      Text('High')
    ];
    return Scaffold(
        appBar: AppBar(
            title: const Text("New Reminder"),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Hi,",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                const Text("What would you like to be reminded with?",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                verticalMargin(),
                const Text(
                  "Title",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                 TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Title(Cannot be blank)',
                  ),
                ),
                verticalMargin(),
                const Text(
                  "Content",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                 TextField(
                  controller: _contentController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Content'),
                ),
                verticalMargin(),
                const Text(
                  "Priority",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                ToggleButtons(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Theme.of(context).primaryColor,
                  selectedColor: Colors.white,
                  fillColor: Theme.of(context).colorScheme.inversePrimary,
                  color: Theme.of(context).primaryColor,
                  constraints: const BoxConstraints(
                    minHeight: 40.0,
                    minWidth: 80.0,
                  ),
                  isSelected: _selectedPriority,
                  onPressed: (index) => {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedPriority.length; i++) {
                        _selectedPriority[i] = i == index;
                      }
                    })
                  },
                  children: priority,
                ),
                const SizedBox(height: 30),
                
                SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    height: 55.0,
                    minWidth: 70.0,
                    color: Theme.of(context).primaryColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    textColor: Colors.white,
                    onPressed: () {
                      setState(() {
                      _title= _titleController.text;
                      _content= _contentController.text;
                      
                      });
                      print('$_title');
                      print('$_content');
                      ReminderForm reminderForm=new ReminderForm(title: _title,content: _content);
                      reminderCubit.saveFormDetails(reminderForm);
                    },
                    splashColor: Colors.redAccent,
                    child:  const Text(
                      "Remind me",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  SizedBox verticalMargin() => const SizedBox(height: 30);
}
