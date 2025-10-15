class ModelTodo {
  int? id;
  String todo;
  String deskripsi;
  String kategori;
  bool status;

  ModelTodo(
    this.todo,
    this.deskripsi,
    this.kategori, {
    this.status = false,
    this.id,
  });

  factory ModelTodo.fromMap(Map<String, dynamic> map) {
    return ModelTodo(
      map['title'],
      map['desc'] ?? '',
      map['category'],
      status: map['status'] == 1,
      id: map['id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': todo,
      'desc': deskripsi,
      'category': kategori,
      'status': status ? 1 : 0,
    };
  }
}
