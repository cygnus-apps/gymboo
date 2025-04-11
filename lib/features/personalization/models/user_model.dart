import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gymboo_admin/utils/constants/enums.dart';
import 'package:gymboo_admin/utils/formatters/formatter.dart';

import 'branch_model.dart';

/// Model class representing user data.
class UserModel {
  final String? id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phoneNumber;
  String profilePicture;
  List<BranchModel> branches;
  AppRole role;
  DateTime? createdAt;
  DateTime? updatedAt;

  /// Constructor for UserModel.
  UserModel({
    this.id,
    required this.email,
    this.firstName = '',
    this.lastName = '',
    this.username = '',
    this.phoneNumber = '',
    this.profilePicture = '',
    this.role = AppRole.user,
    this.createdAt,
    this.updatedAt,
    this.branches = const [], // Default to empty list
  });



  /// Helper methods
  String get fullName => '$firstName $lastName';
  String get formattedDate => gbFormatter.formatDate(createdAt);
  String get formattedUpdatedAtDate => gbFormatter.formatDate(updatedAt);
  String get formattedPhoneNumber => gbFormatter.formatPhoneNumber(phoneNumber);

  // Static function to split full name into first and last name.
  static List<String> nameParts(String fullName) => fullName.split(" ");

  // Static function to generate a username from the full name.
  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName"; // Combine first and last name
    String usernameWithPrefix = "gb_$camelCaseUsername"; // Add "cwt_" prefix
    return usernameWithPrefix;
  }

  /// Static function to create an empty user model.
  static UserModel empty() => UserModel(email: '');

  /// Convert model to Json structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'role': role.name.toString(),

      'createdAt': createdAt,
      'updatedAt': updatedAt ?? DateTime.now(),
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data.containsKey('firstName') ? data['firstName'] ?? '' : '',
        lastName: data.containsKey('lastName') ? data['lastName'] ?? '' : '',
        username: data.containsKey('username') ? data['username'] ?? '' : '',
        email: data.containsKey('email') ? data['email'] ?? '' : '',
        phoneNumber: data.containsKey('phoneNumber') ? data['phoneNumber'] ?? '' : '',
        profilePicture: data.containsKey('profilePicture') ? data['profilePicture'] ?? '' : '',
        role: data.containsKey('role') ? (data['role'] ?? AppRole.user) == AppRole.admin.name.toString() ? AppRole.admin : AppRole.user : AppRole.user,
        createdAt: data.containsKey('CreatedAt') ? data['CreatedAt']?.toDate() ?? DateTime.now() : DateTime.now(),
        updatedAt: data.containsKey('UpdatedAt') ? data['UpdatedAt']?.toDate() ?? DateTime.now() : DateTime.now(),
      );
    } else {
      return empty();
    }
  }
}