import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gymboo_admin/utils/constants/enums.dart';
import 'package:gymboo_admin/utils/formatters/formatter.dart';




/// Model class representing user data.
class UserModel {
  final String? id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phoneNumber;
  String profilePicture;
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
  });

  /// Helper methods
  String get fullName => '$firstName $lastName';
  String get formattedDate => gbFormatter.formatDate(createdAt);
  String get formattedUpdatedAtDate => gbFormatter.formatDate(updatedAt);
  String get formattedPhoneNumber => gbFormatter.formatPhoneNumber(phoneNumber);

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
        firstName: data.containsKey('nombre') ? data['nombre'] ?? '' : '',
        lastName: data.containsKey('apellidos') ? data['apellidos'] ?? '' : '',
        username: data.containsKey('usuario') ? data['usuario'] ?? '' : '',
        email: data.containsKey('email') ? data['email'] ?? '' : '',
        phoneNumber: data.containsKey('telefono') ? data['telefono'] ?? '' : '',
        profilePicture: data.containsKey('foto') ? data['foto'] ?? '' : '',
        role: data.containsKey('rol') ? (data['rol'] ?? AppRole.user) == AppRole.admin.name.toString() ? AppRole.admin : AppRole.user : AppRole.user,
        createdAt: data.containsKey('CreatedAt') ? data['CreatedAt']?.toDate() ?? DateTime.now() : DateTime.now(),
        updatedAt: data.containsKey('UpdatedAt') ? data['UpdatedAt']?.toDate() ?? DateTime.now() : DateTime.now(),
      ); // UserModel
    } else {
      return empty();
    }
  }
}