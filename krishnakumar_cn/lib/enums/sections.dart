enum Section {
  WorkExperience,
  Projects,
  Tech,
  Personal,
}

extension SectionExtension on Section {
  String get displayText {
    switch (this) {
      case Section.WorkExperience:
        return 'Work Experience';

      case Section.Projects:
        return 'Projects';
      case Section.Tech:
        return 'Technologies';
      case Section.Personal:
        return 'Personal info';
      default:
        return '';
    }
  }
}
