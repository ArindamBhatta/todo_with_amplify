import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/common/scrollable_tab_bar.dart';
import 'package:todo/data/todo.dart';
import 'package:todo/home/add_task_form.dart';
import 'package:todo/home/details_page.dart';
import 'package:animations/animations.dart';
import 'package:todo/logic/todo_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: dummyData.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Todo App')),
        backgroundColor: Colors.tealAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Column(
          children: [
            ScrollableTabBar(
              menuOptions:
                  UrgencyLevel.values.map((label) => label.value).toList(),
              tabController: _tabController,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children:
                    dummyData.map((task) {
                      return Text(task.name);
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: OpenContainer(
      //   transitionDuration: Duration(milliseconds: 900),
      //   transitionType: _transitionType,
      //   openBuilder: (context, action) {
      //     return AddTaskForm(onAdd: _addTaskToList);
      //   },
      //   closedElevation: 6,
      //   closedShape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(50),
      //   ),
      //   closedColor: Colors.teal,
      //   openColor: Colors.white,

      //   closedBuilder: (context, action) {
      //     return FloatingActionButton(
      //       backgroundColor: Colors.teal,
      //       onPressed: null,
      //       child: const Icon(Icons.add, size: 30, color: Colors.white),
      //     );
      //   },
      // ),
    );
  }
}
