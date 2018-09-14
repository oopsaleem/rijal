class ValidationMixin {
  String validateEmail(String value, String errorMessage) {
    return (!value.contains('@') ? errorMessage : null);
  }

  String validatePassword(String value, String errorMessage) {
    return (value.length < 8 ? errorMessage : null); 
  }
}