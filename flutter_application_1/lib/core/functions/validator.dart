class MyValidators {
  static String? displayNamevalidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'Display name cannot be empty';
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return 'Display name must be between 3 and 20 characters';
    }

    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone';
    }
    if (!value.startsWith('010')&&!value.startsWith('011')&&!value.startsWith('012')&&!value.startsWith('015')) {
      return 'Phone number must start with 010, 011, 012, or 015';
    }
   if (value.length != 11) {
  return 'Phone number must be exactly 11 digits';
}


    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  static String? nationalIdValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a national ID';
    }
    if (value.length != 14) {
  return 'National ID must be exactly 14 digits';
}

    return null;
  }

  static String? repeatPasswordValidator({String? value, String? password}) {
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? genderValidator({String? value}) {
    if (value == null || value.isEmpty) {
      return 'Please enter gender';
    }
    return null;
  }

  static String? imageValidator(String? image) {
    if (image == null || image.isEmpty) {
      return 'Image cannot be empty';
    }
    return null;
  }

  static String? tokenValidator(String? val) {
    if (val == null || val.isEmpty) {
      return 'Token cannot be empty';
    }
    return null;
  }
}