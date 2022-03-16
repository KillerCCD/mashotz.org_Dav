import 'package:formz/formz.dart';

enum PassowrdValidatorError { invalid }

class Password extends FormzInput<String, PassowrdValidatorError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegExp = RegExp(r'[a-zA-Z]');
  @override
  PassowrdValidatorError? validator(String? value) {
    return _passwordRegExp.hasMatch(value!)
        ? null
        : PassowrdValidatorError.invalid;
  }
}
