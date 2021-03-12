import 'package:flutter/material.dart';

void main() => runApp(ExampleWidget());

VoidCallback nothing = () => {};

class ExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Пример',
        theme: ThemeData(primarySwatch: Colors.grey),
        home: ExamplePage(title: 'Страничка'),
      );
}

class ExamplePage extends StatefulWidget {
  ExamplePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  ExamplePageState createState() => ExamplePageState();
}

class ExamplePageState extends State<ExamplePage> {
  final elements = <Widget>[];

  void someOperation() {
    for (int i = 0; i < 10; i++) {
      elements.add(button());
    }
  }

  void addButtons() {
    setState(() => someOperation());
  }

  Container button() => Container(
        padding: EdgeInsets.all(5),
        child: OutlinedButton(
          child: Text("Кнопка ${elements.length}"),
          onPressed: nothing,
        ),
      );

  Container body(BuildContext context) {
    var defaultWidgets = <Widget>[
      Text('Ты добавил кнопок:'),
      Text('${elements.length}', style: Theme.of(context).textTheme.headline4),
      TextButton(
        onPressed: addButtons,
        child: Text("Добавить кнопку"),
      ),
    ];
    var all = defaultWidgets + elements;
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: ListView.builder(itemBuilder: (context, index) => all[index], itemCount: all.length));
  }

  @override
  Widget build(BuildContext context) => Scaffold(body: body(context));
}
