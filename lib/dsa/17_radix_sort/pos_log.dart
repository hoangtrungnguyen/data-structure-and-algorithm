void main() {}

class PosLog {
  final logData = <String, List<Log>>{};

  void addLog(String uid, String message) {
    if (logData[uid] == null) {
      logData[uid] = <Log>[];
    }

    final now = DateTime.now().millisecondsSinceEpoch;
    logData[uid]!.add(Log(
      message,
      now,
    ));
  }

  List<Log> getLogsByUserSortByMessageLexicalOrder(){
    return [];
  }
}

class Log {
  late String uuid;
  String message;
  int time;

  Log(this.message, this.time) {
    uuid = getUuid();
  }

  String getUuid() {
    return '';
  }
}
