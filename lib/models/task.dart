class Task {
  String description;
  bool completed;
  late DateTime createdAt;

  Task({
    required this.description,
    this.completed = false,
  });
}
