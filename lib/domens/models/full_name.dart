import 'package:formz/formz.dart';

enum FullNameValidator { invliad }

class FullName extends FormzInput<String, FullNameValidator> {
  const FullName.pure() : super.pure('');
  const FullName.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(r'[a-zA-Z]');
  @override
  FullNameValidator? validator(String? value) {
    return _emailRegExp.hasMatch(value ?? '') ? null : FullNameValidator.invliad;
  }
}