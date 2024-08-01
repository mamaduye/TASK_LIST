

import 'package:flutter_tasklist_app/data/models/add_task_request_model.dart';
import 'package:flutter_tasklist_app/data/models/add_task_response_model.dart';
import "package:flutter_tasklist_app/data/models/task_response_model.dart";
import 'package:http/http.dart' as http;

class TaskRemoteDatasource {
  Future<TaskResponsModel> getTasks() async {
    final response = await http.get(
      Uri.parse('http://localhost:3000/api/tasks'),
    );
    if (response.statusCode == 200) {
      return TaskResponsModel.fromJson(response.body);
    } else {
      throw Exception('failed to load tasks');
    }
  }

  Future<AddTaskResponseModel> addTask(AddTaskRequestModel data) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/api/tasks'),
      body: data.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return AddTaskResponseModel.fromJson(response.body);
    } else {
      throw Exception('failed to add task');
    }
  }

  Future<AddTaskResponseModel> deleteTask(String id) async {
    final response = await http.delete(
      Uri.parse('http://localhost:3000/api/tasks/$id'),
    );
    if (response.statusCode == 200) {
      return AddTaskResponseModel.fromJson(response.body);
    } else {
      throw Exception('failed to delete task');
    }
  }
  
  Future<AddTaskResponseModel> updateTask(
      String id, AddTaskRequestModel data) async {
    final response = await http.put(
      Uri.parse('http://localhost:3000/api/tasks$id'),
      body: data.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return AddTaskResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to update task');
    }
  } 
}
