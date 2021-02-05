class Validator {
  static String validateTitle(String val) {
    return (val.isEmpty | (val.length > 15))
        ? 'Enter a valid name ( not too long )'
        : null;
  }

  static String validateNotes(String val) {
    return (val.length > 100) ? 'too much text' : null;
  }
}
