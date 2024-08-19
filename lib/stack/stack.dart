class Stack<E> {
  Stack() : _storage = <E>[];
  final List<E> _storage;

  bool get isEmpty => _storage.isEmpty;

  bool get isNotEmpty => !isEmpty;

  E get peek => _storage.last;
  void push(E value) {
    _storage.add(value);
  }

  E? pop() {
    if (_storage.isEmpty) return null;
    return _storage.removeLast();
  }

  @override
  String toString() {
    return 'Stack{_storage: ${_storage.join('\n')}}';
  }
}
