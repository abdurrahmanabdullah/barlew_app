import 'package:barlew_app/features/engineer/personal_information/model/engineer_profile_model.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  EngineerProfileModel? _profile;

  EngineerProfileModel? get profile => _profile;

  void setProfile(EngineerProfileModel profile) {
    _profile = profile;
    notifyListeners();
  }
}
