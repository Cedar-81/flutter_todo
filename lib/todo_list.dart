import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool isChecked = true;
  List<Map<String, dynamic>> todos = List.generate(20, (index) {
    return {
      'title': 'Task $index',
      'checked': false,
    };
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          height: 400,
          decoration: BoxDecoration(color: Colors.green[500]),
          child: const Center(
              child: Text("Cedars Tasks",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Tasks",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700])),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: todos.length,
                      itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            decoration: BoxDecoration(
                                color: todos[index]['checked']
                                    ? Colors.green[300]
                                    : Colors.green[200],
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  todos[index]["title"],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                        // tristate: true,
                                        value: todos[index]['checked'],
                                        activeColor: Colors.green[500],
                                        onChanged: (bool? value) {
                                          setState(() {
                                            todos[index]['checked'] =
                                                value ?? false;
                                          });
                                        }),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            todos.removeAt(index);
                                          });
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red[500],
                                        ))
                                  ],
                                )
                              ],
                            ),
                          )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
