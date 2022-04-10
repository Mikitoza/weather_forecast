enum MainPageTab {
  today,
  forecast,
}

extension TabToInt on MainPageTab {
  int parseTab() {
    switch (this) {
      case MainPageTab.today:
        return 0;
      case MainPageTab.forecast:
        return 1;
    }
  }
}
