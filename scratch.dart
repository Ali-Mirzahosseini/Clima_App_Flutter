import 'dart:io';

void main(){
  performTasks();
}

void performTasks() async{
  task1();
  String? dataFromTask2 = await task2();
  task3(dataFromTask2);
}

void task1(){
 print('Task 1 is completed.');
}

Future<String?> task2() async{
  String? data;
  Duration threeSeconds = Duration(seconds: 3);
  await Future.delayed(threeSeconds, (){
    print('Task 2 is completed.');
    data = 'task 2 data';
  });
  return data;
}

void task3(dataFromTask2){
  print('Task 3 is completed with $dataFromTask2');
}