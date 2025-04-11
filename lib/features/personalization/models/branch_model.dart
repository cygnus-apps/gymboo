import 'package:cloud_firestore/cloud_firestore.dart';

class BranchModel {
  final String branch;
  final String name;
  final String state;
  final String isDefault;

  BranchModel({
    required this.branch,
    required this.name,
    required this.state,
    required this.isDefault
  });

  factory BranchModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return BranchModel(
      branch: data["branch"] ?? "",
      name: data["name"] ?? "",
      state: data["state"] ?? "A",
      isDefault: data["isDefault"] ?? "N",
    );
  }
}