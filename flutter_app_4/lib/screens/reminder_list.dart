
import 'package:flutter/material.dart';
import 'package:flutter_app_4/cubits/ReminderState.dart';
import 'package:flutter_app_4/cubits/new_reminder_cubit.dart';
import 'package:flutter_app_4/models/reminder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReminderListWidget extends StatefulWidget {
  const ReminderListWidget({super.key});

  @override
  State<ReminderListWidget> createState() => _ReminderListWidgetState();
}

class _ReminderListWidgetState extends State<ReminderListWidget> {
  @override
  Widget build(BuildContext context) {
    final listCubit = BlocProvider.of<NewReminderCubit>(context);
    listCubit.getAllForms();
    return  Scaffold(
      appBar: AppBar(
        title: Text("Reminder list"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary
      ),
      body: BlocBuilder<NewReminderCubit, ReminderListState>(
        builder: (context, state) {
         if(state is RemindersLoadedState){
          if(state.reminderItems.isNotEmpty){
          return ListView.builder(
            padding:EdgeInsets.all(20),
            shrinkWrap: false,
            itemCount: state.reminderItems.length,
            itemBuilder: (context,index){
              final item= state.reminderItems[index];
              return ListItem(item: item);
            });
          }else{
          return const Center(
            child: Text("No Items",style: TextStyle(fontSize: 18),)
          );
         }
         }
         else if(state is RemindersLoadingState){
          return const Center(child: CircularProgressIndicator());
         }
         else{
          return const Center(child: CircularProgressIndicator());
         }
        }
        ,
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.item,
  });

  final ReminderForm item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title??'',
              style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text(item.content??''),
          ],
        ),
      )
    );
  }
}