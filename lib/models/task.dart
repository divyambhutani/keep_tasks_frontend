class Task {
  String description;
  bool completed;
   DateTime createdAt=DateTime.now();

  Task({
    required this.description,
    this.completed = false,
    
  });
}
