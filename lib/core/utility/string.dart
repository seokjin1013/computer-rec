String getCommaSeperatedPrice(String value) {
  String s = '';
  for (int i = 0; i < value.length; ++i) {
    int remaining = value.length - i;
    if (remaining % 3 == 0 && remaining != value.length) {
      s += ',';
    }
    s += value[i];
  }
  return s;
}
