import 'package:flutter_app_4/cubits/ReminderState.dart';
import 'package:flutter_app_4/db/DataBaseHelper.dart';
import 'package:flutter_app_4/models/reminder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewReminderCubit extends Cubit<ReminderListState> {
  NewReminderCubit() : super(RemindersLoadingState()){
    getAllForms();
  }

  void saveFormDetails(ReminderForm form) async {
    await DatabaseHelper.instance.insertFormData(form);
  }

  void getAllForms() async {
    emit(RemindersLoadedState(await DatabaseHelper.instance.getAllFormData()));
  }
}
