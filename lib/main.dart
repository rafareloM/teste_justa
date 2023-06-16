import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = '';
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    filled: true,
                    hintText: 'I lo0ve3 dogs!!!',
                    hintStyle: TextStyle(color: Colors.black38),
                    label: Text('Escreva sua frase:')),
                controller: textEditingController,
              ),
            ),
            const Text(
              'A maior palavra da frase é:',
            ),
            Text(
              result,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          result = findBiggestWord(textEditingController.text);
          textEditingController.clear();
        }),
        tooltip: 'Enviar',
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //Método para achar a maior palavra da frase.
  String findBiggestWord(String phrase) {
    List splittedPhrase = phrase.split(' ');
    String biggestWord = '';
    for (String word in splittedPhrase) {
      //Regex para limpar a palavra antes de testar.
      word = word.replaceAll(RegExp('[^A-Za-z]'), '');
      //Primeira atribuição do biggestWord, caso seja a primeira palavra.
      if (biggestWord == '') {
        biggestWord = word;
      }
      //Caso a atual seja maior, ele redefinirá o result.
      if (word.length > biggestWord.length) {
        biggestWord = word;
      }
    }
    return biggestWord;
  }
}
