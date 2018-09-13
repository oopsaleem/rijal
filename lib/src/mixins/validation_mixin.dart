class ValidationMixin {
  String validateEmail(String value) {
    return (!value.contains('@') ? 'Invalid email.' : null);
  }

  String validatePassword(String value) {
    return (value.length < 8 ? 'Invalid password.' : null); 
  }
}