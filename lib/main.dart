import 'package:flutter/material.dart';
import 'package:flutter_bloc/model/todo.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> todos = [];

  final TextEditingController _todoController = TextEditingController();

  @override
  initState() {
    super.initState();
    print("initstate");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Catatan Apps"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _todoController,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_todoController.text.length > 0) {
                      todos.add(Todo(_todoController.text));
                      _todoController.text = "";
                    }
                  });
                },
                child: Text("Tambah"),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: todos.length > 0
                    ? ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${todos[index].name}",
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
                    : Text(
                        "Belum Ada Catatan",
                        textAlign: TextAlign.center,
                      ),
              )
            ],
          ),
        ));
  }
}
