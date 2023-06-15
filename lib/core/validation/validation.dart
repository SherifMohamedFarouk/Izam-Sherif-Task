extension ExtString on String {

  // this validation for the @izam.co email only
  bool get isValidIzamEmailOnly {
    final emailRegExp = RegExp(r'^[a-zA-Z]{3}.[0-9]{4}@izam.co$');
    return emailRegExp.hasMatch(this);
  }

  // this validation for all the emails like @gmail.com and @yahoo.com
  bool get isValidEmailForEveryTypeOFEmail {
    final emailRegExp = RegExp(r'^[a-zA-Z]{3}.[0-9]{4}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp =
        RegExp(r'^(?=.*[0-9])(?=.*[!$#^*])[a-zA-Z0-9!$#^*]{8,}$');
    return passwordRegExp.hasMatch(this);
  }
}
