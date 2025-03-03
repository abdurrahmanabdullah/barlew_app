import 'package:flutter/material.dart';

class SelectedAnswersModel with ChangeNotifier {
  final List<int> _selectedQuestions = []; // Store selected question IDs
  final List<int> _selectedAnswers = [];
  // Store corresponding answer IDs
  int? _serviceID;
  List<int> get selectedQuestions => _selectedQuestions;
  List<int> get selectedAnswers => _selectedAnswers;
  int? get serviceID => _serviceID;

  // Set the service ID
  void setServiceID(int id) {
    _serviceID = id;
    notifyListeners();
  }

  // Add selected answer for a specific question
  void addSelectedAnswer(int questionID, int answerID) {
    // Check if the question ID already exists
    if (!_selectedQuestions.contains(questionID)) {
      _selectedQuestions.add(questionID);
      _selectedAnswers.add(answerID);
    } else {
      // Update the answer if question is already in the list
      final index = _selectedQuestions.indexOf(questionID);
      _selectedAnswers[index] = answerID;
      _selectedQuestions[index] = questionID;
    }
    notifyListeners();
  }

  // Remove selected answer for a specific question
  void removeSelectedAnswer(int questionID) {
    final index = _selectedQuestions.indexOf(questionID);
    if (index != -1) {
      _selectedQuestions.removeAt(index);
      _selectedAnswers.removeAt(index);
    }
    notifyListeners();
  }

  // Clear all selected answers
  void clearAnswers() {
    _selectedQuestions.clear();
    _selectedAnswers.clear();
    _serviceID = null;
    notifyListeners();
  }
}
