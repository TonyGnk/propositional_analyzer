// default if values missing then all both false

class SettingsToggle {
  const SettingsToggle({
    //if null then false
    this.darkThemeSwitcher = false,
    this.uiThemeSwitcher = false,
  });

  final bool darkThemeSwitcher;
  final bool uiThemeSwitcher;
}
