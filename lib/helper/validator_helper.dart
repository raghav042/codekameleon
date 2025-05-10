class ValidatorHelper {
  const ValidatorHelper._();
  /*
  1. User will just type spaces and try to access
    fix - remove white spaces and and check if empty
  */
  /// Validate user name that it is not null and should be greater than two characters
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      // First it will remove white spaces and then check whether it has any empty value
      return "Please enter your name";
    } else if (value.trim().length < 2) {
      return "Name is too short";
    } else {
      return null;
    }
  }

  // Validate gmail that is not null and is in proper format
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your email";
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim())) {
      return "Enter a valid email address";
    } else {
      return null;
    }
  }

  // validate if the password is not null and is greater than 6
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your password";
    } else if (value.length < 6) {
      return "Password must be greater than 6 characters";
    }
    return null;
  }

  // Validating that our password is same as original password So, I'm taking two parameters
  // 1. original password
  // 2. new password
  static String? validateConfirmPassword(
      String? value, String originalPassword) {
    if (value == null || value.trim().isEmpty) {
      return "Please confirm your password";
    } else if (value != originalPassword) {
      return "Passwords do not match";
    } else {
      return null;
    }
  }


}
