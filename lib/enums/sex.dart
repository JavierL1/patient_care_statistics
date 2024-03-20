enum Sex { male, female, other }

String sexToString(Sex sex) {
  switch (sex) {
    case Sex.male:
      return 'Masculino';
    case Sex.female:
      return 'Femenino';
    default:
      return 'Otro';
  }
}

Sex stringToSex(String? sex) {
  switch (sex) {
    case 'male':
      return Sex.male;
    case 'female':
      return Sex.female;
    default:
      return Sex.other;
  }
}
