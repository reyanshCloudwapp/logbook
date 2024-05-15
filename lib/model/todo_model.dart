class TodoModel {
  String todo;
  String createdTime;
  bool isComplete;

  TodoModel({
    required this.todo,
    required this.createdTime,
    required this.isComplete,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoModel &&
          runtimeType == other.runtimeType &&
          todo == other.todo &&
          createdTime == other.createdTime &&
          isComplete == other.isComplete);

  @override
  int get hashCode =>
      todo.hashCode ^ createdTime.hashCode ^ isComplete.hashCode;

  @override
  String toString() {
    return 'TodoModel{ todo: $todo, createdTime: $createdTime, isComplete: $isComplete,}';
  }

  TodoModel copyWith({
    String? todo,
    String? createdTime,
    bool? isComplete,
  }) {
    return TodoModel(
      todo: todo ?? this.todo,
      createdTime: createdTime ?? this.createdTime,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'todo': todo,
      'createdTime': createdTime,
      'isComplete': isComplete,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      todo: map['todo'] as String,
      createdTime: map['createdTime'] as String,
      isComplete: map['isComplete'] as bool,
    );
  }
}
