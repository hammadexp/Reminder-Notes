class ReminderForm {
  int? id;
  String? title;
  String? content;

  ReminderForm({this.id, this.title, this.content});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'content': content};
  }

// Create a FormData object from a Map retrieved from the database
  factory ReminderForm.fromMap(Map<String, dynamic> map) {
    return ReminderForm(
      id: map['id'],
      title: map['title'],
      content: map['content']
    );
  }
}
