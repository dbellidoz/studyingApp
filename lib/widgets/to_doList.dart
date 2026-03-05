import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class To_doList extends StatefulWidget {
  const To_doList({super.key});

  @override
  State<StatefulWidget> createState() => _To_doListState();
}

class _To_doListState extends State<To_doList> {
  final _formkey = GlobalKey<FormState>();
  String tarea = '';
  List<String> listaTareas = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(228, 248, 244, 244),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formkey,
            child: Row(
              children: [
                Expanded(
                  // ← esto le da el ancho restante al TextFormField
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: 'Nueva Tarea'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Escribe una tarea';
                      }
                      return null;
                    },
                    onSaved: (value) => tarea = value!,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      setState(() {
                        listaTareas.add(tarea);
                      });
                      _formkey.currentState!.reset();
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: listaTareas.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(listaTareas[index]));
            },
          ),
        ],
      ),
    );
  }
}
