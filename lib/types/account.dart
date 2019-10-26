
class SettingItem {
  final String settingKey;
  final String settingValue;

  SettingItem(this.settingKey, this.settingValue);

  static List<SettingItem> get mock {
    return [
      SettingItem('First name', 'Brecht'),
      SettingItem('Last name', 'Horsten'),
      SettingItem('Email address', 'brecht.horsten@quivr.be'),
      SettingItem('Language', 'English'),
    ];
  }
}
