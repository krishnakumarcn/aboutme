enum Section {
  WorkExperience,
  Education,
  Tech,
  // Personal,
}

extension SectionExtension on Section {
  String get displayText {
    switch (this) {
      case Section.WorkExperience:
        return 'Work Experience';

      case Section.Education:
        return 'Education';
      case Section.Tech:
        return 'Technologies';
      // case Section.Personal:
      //   return 'Personal info';
      default:
        return '';
    }
  }
}
