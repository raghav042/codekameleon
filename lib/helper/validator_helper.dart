class ValidatorHelper {
  const ValidatorHelper._();

  /// Validate user name that it is not null and should be greater than two characters
  static String? validateName(String? value) {
    if (value == null) {
      return "Please enter your name";
    } else if (value.trim().length < 2) {
      return "Name is too short";
    } else {
      return null;
    }
  }

  //TODO: write functions to validate other fields
}
