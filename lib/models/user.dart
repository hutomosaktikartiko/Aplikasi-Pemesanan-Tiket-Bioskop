part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final String password;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;

  User(this.id, this.email,
      {this.name,
      this.profilePicture,
      this.password,
      this.selectedGenres,
      this.selectedLanguage,
      this.balance});

  @override
  String toString() {
    return "[$id] - $name, $email";
  }

  @override
  List<Object> get props => [
        id,
        email,
        name,
        profilePicture,
        password,
        selectedGenres,
        selectedLanguage,
        balance
      ];
}
