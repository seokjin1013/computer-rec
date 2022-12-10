import 'computer_item.dart';

abstract class NoComputerItem {}

class NoCPU implements ComputerCPU, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class NoVGA implements ComputerVGA, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class NoRAM implements ComputerRAM, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class NoMainBoard implements ComputerMainBoard, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class NoSSD implements ComputerSSD, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class NoHDD implements ComputerHDD, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class NoCooler implements ComputerCooler, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class NoPower implements ComputerPower, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class NoCase implements ComputerCase, NoComputerItem {
  @override
  int get id => 0;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
