// Authentication related validators

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Please enter your email';
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
    return 'Please enter a valid email';
  }
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Please enter your password';
  } else if (password.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Please enter your name';
  } else if (name.length < 3) {
    return 'Name must be at least 3 characters';
  }
  return null;
}

String? confirmPasswordValidator(String? password, String? confirmPassword) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'Please confirm your password';
  } else if (confirmPassword != password) {
    return 'Passwords do not match';
  }
  return null;
}

// Project related validators

String? projectNameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Please enter project name';
  } else if (name.length < 6) {
    return 'Project name must be greater than 6 characters';
  }
  return null;
}

// Report related validators

String? reportTitleValidator(String? title) {
  if (title == null || title.isEmpty) {
    return 'Please enter report title';
  } else if (title.length < 6) {
    return 'Report title must be greater than 6 characters';
  }
  return null;
}

String? reportDescriptionValidator(String? description) {
  if (description == null || description.isEmpty) {
    return 'Please enter report description';
  } else if (description.length < 10) {
    return 'Report description must be greater than 10 characters';
  }
  return null;
}