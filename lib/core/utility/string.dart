String getCommaSeperatedPrice(String value) {
  String s = '';
  for (int i = 0; i < value.length; ++i) {
    if ((value.length - i) % 3 == 0 && i != 0) {
      s += ',';
    }
    s += value[i];
  }
  return s;
}
