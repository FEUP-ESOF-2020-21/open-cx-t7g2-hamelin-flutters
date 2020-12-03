class ValidatorFactory {
  static Function getValidator(String fieldName,
      {bool fieldRequired = false,
      int lowerLimit = -1,
      int upperLimit = -1,
      Function extender}) {
    String Function(String value) f = (value) {
      if (fieldRequired) {
        if (value.length == 0) {
          return fieldName + " can not be empty";
        } else if (lowerLimit != -1 && value.toString().length < lowerLimit) {
          return fieldName +
              " may not have less than " +
              lowerLimit.toString() +
              " characters";
        } else if (upperLimit != -1 && value.toString().length > upperLimit) {
          return fieldName +
              " may not have more than " +
              upperLimit.toString() +
              " characters";
        }
      } else if (value.toString().length != 0) {
        // Se não for obrigatório ter mas existir tem de cumprir os requesitos
        if (lowerLimit != -1 && value.toString().length < lowerLimit) {
          return fieldName +
              " may not have less than " +
              lowerLimit.toString() +
              " characters";
        } else if (upperLimit != -1 && value.toString().length > upperLimit) {
          return fieldName +
              " may not have more than " +
              upperLimit.toString() +
              " characters";
        }
      }
      /*
      if (fieldRequired && value.length == 0) {
        return fieldName + " can not be empty";
      } else if (fieldRequired &&
          lowerLimit != -1 &&
          value.toString().length < lowerLimit) {
        return fieldName +
            " may not have less than " +
            lowerLimit.toString() +
            " characters";
      } else if (fieldRequired &&
          upperLimit != -1 &&
          value.toString().length > upperLimit) {
        return fieldName +
            " may not have more than " +
            upperLimit.toString() +
            " characters";
      }*/
      if (extender == null) return null;
      return extender(value);
    };
    return f;
  }
}
