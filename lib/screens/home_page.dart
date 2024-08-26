import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  final List<String> tasks = <String>[];
  final List<bool> checkBoxes = List.generate(8, (index) => false);
  TextEditingController nameController = TextEditingController();

  void addItemToList() async {
    final String taskName = nameController.text;

    await db.collection('tasks').add({
      'name': taskName,
      'completed': false,
      'timestamp': FieldValue.serverTimestamp(),
    });

    setState(() {
      tasks.insert(0, taskName);
    });
  }

  void removeItems(int index) async {
    // Get the task to be removed
    String taskToBeRemoved = tasks[index];

    // Remove the task from Firestore
    QuerySnapshot querySnapshot = await db
        .collection('tasks')
        .where('name', isEqualTo: taskToBeRemoved)
        .get();

    if (querySnapshot.size > 0) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs[0];

      // Delete the document from Firestore
      await db.collection('tasks').doc(documentSnapshot.id).delete();

      // Update the state after deletion
      setState(() {
        tasks.removeAt(index);
        checkBoxes.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
