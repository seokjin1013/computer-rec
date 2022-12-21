import 'computer_item.dart';

abstract class NoComputerItem {}

class NoCPU implements ComputerCPU, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  String get partName => 'CPU';

  @override
  int get cheapPrice => 0;
}

class NoVGA implements ComputerVGA, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  String get partName => 'GPU';

  @override
  int get cheapPrice => 0;
}

class NoRAM implements ComputerRAM, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  String get partName => 'RAM';

  @override
  int get cheapPrice => 0;
}

class NoMainBoard implements ComputerMainBoard, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  String get partName => 'Mainboard';

  @override
  int get cheapPrice => 0;
}

class NoSSD implements ComputerSSD, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  String get partName => 'SSD';

  @override
  int get cheapPrice => 0;
}

class NoHDD implements ComputerHDD, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  String get partName => 'HDD';

  @override
  int get cheapPrice => 0;
}

class NoCooler implements ComputerCooler, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  String get partName => 'Cooler';

  @override
  int get cheapPrice => 0;
}

class NoPower implements ComputerPower, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  String get partName => 'Power';

  @override
  int get cheapPrice => 0;
}

class NoCase implements ComputerCase, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  String get partName => 'Case';

  @override
  int get cheapPrice => 0;
}

class NoMonitor implements ComputerMonitor, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  String get partName => 'Monitor';

  @override
  int get cheapPrice => 0;
}

class NoKeyboard implements ComputerKeyboard, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  String get partName => 'Keyboard';

  @override
  int get cheapPrice => 0;
}

class NoMouse implements ComputerMouse, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  String get partName => 'Mouse';

  @override
  int get cheapPrice => 0;
}
