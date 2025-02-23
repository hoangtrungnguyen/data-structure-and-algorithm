void main() {
  Column(children: [
    Padding(child: Text(text: "")),
    Padding(child: Text(text: "")),
    Padding(child: Text(text: "")),
  ]);
}

class WidgetTree {}

abstract class Widget {}

class Column extends Widget {
  List<Widget> children;

  Column({
    required this.children,
  });
}

class Padding extends Widget {
  Widget child;

  Padding({
    required this.child,
  });
}

class Text extends Widget {
  String text;

  Text({
    required this.text,
  });
}
