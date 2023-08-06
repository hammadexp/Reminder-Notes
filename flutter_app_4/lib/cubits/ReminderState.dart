


import 'package:flutter_app_4/cubits/new_reminder_cubit.dart';
import 'package:flutter_app_4/models/reminder.dart';
import 'package:flutter_app_4/screens/new_reminder_form.dart';

abstract class ReminderListState{}

class RemindersLoadingState extends ReminderListState{}

class RemindersLoadedState extends ReminderListState{
    final List<ReminderForm> reminderItems;
    RemindersLoadedState(this.reminderItems);
}

class RemindersErrorState extends ReminderListState{
  final String error;
  RemindersErrorState(this.error);
}