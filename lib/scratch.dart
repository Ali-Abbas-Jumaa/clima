// import 'dart:io';

void main() => performTasks();

void performTasks() async {
  taskOne();
  // taskTwo();
  String task2 = await taskTwo();
  taskThree(task2);
}

void taskOne() => print("task one");

Future<String> taskTwo() async {
  String result;
  Duration duration = Duration(seconds: 2);
  // sleep(duration);
  await Future.delayed(duration, () {
    result = "task two data";
    print("task two ");
  });
  return result;
}

void taskThree(taskTwo) => print("task three is done with: $taskTwo");
