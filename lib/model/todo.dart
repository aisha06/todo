/// Class model for save All TODO Tasks
class ToDo {
  /// Task Id
  String? id;

  /// Task text
  String? todoText;

  /// Is  Done => bool
  bool isDone;

  /// created time
  DateTime? createdAt = DateTime.now();

  /// Done time
  DateTime? doneAt = DateTime.now();

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
    this.createdAt,
    this.doneAt,
  });
}
