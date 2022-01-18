import 'package:flutter/material.dart';
import 'package:note_apps/model/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> todos = [];

  final TextEditingController _todoController = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Catatan Apps"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _todoController,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_todoController.text.isNotEmpty) {
                      todos.add(Todo(_todoController.text));
                      _todoController.text = "";
                    }
                  });
                },
                child: const Text("Tambah"),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: todos.isNotEmpty
                    ? ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "$todos[index].name",
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      todos.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.restore_from_trash,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )
                    : const Text(
                        "Belum Ada Catatan",
                        textAlign: TextAlign.center,
                      ),
              )
            ],
          ),
        ));
  }
}
