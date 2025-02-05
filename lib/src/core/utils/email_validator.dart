bool validateEmail(String email) {
  // Regular expression for validating email
  String pattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}

// Email validation regex pattern (basic validation to exclude weird characters)
final RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+"); // Allows letters, numbers, and dots, but excludes special characters like %, &, etc.