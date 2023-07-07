import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_computer_item_replacable.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/computer_item.dart';
import '../../domain/entities/no_item.dart';
import '../../domain/entities/program_fit.dart';
import '../../domain/entities/recommend_input.dart';
import '../../domain/entities/recommend_output.dart';
import '../../domain/usecases/get_bottleneck_cpu_vga.dart';
import '../../domain/usecases/get_computer_item.dart';
import '../../domain/usecases/get_computer_program_fit.dart';
import '../../domain/usecases/get_recommend_output.dart';

class RecommendOutputProvider with ChangeNotifier {
  final GetComputerProgramFit getComputerProgramFit;
  final GetBottleneckCPUVGA getBottleneckCPUVGA;
  final GetRecommendOutput getRecommendOutput;
  final GetComputerCPU getComputerCPU;
  final GetComputerVGA getComputerVGA;
  final GetComputerRAM getComputerRAM;
  final GetComputerMainBoard getComputerMainBoard;
  final GetComputerSSD getComputerSSD;
  final GetComputerHDD getComputerHDD;
  final GetComputerCooler getComputerCooler;
  final GetComputerPower getComputerPower;
  final GetComputerCase getComputerCase;
  final GetComputerMonitor getComputerMonitor;
  final GetComputerKeyboard getComputerKeyboard;
  final GetComputerMouse getComputerMouse;
  final GetComputerCPUReplacable getComputerCPUReplacable;
  final GetComputerVGAReplacable getComputerVGAReplacable;
  final GetComputerRAMReplacable getComputerRAMReplacable;
  final GetComputerMainBoardReplacable getComputerMainBoardReplacable;
  final GetComputerSSDReplacable getComputerSSDReplacable;
  final GetComputerHDDReplacable getComputerHDDReplacable;
  final GetComputerCoolerReplacable getComputerCoolerReplacable;
  final GetComputerPowerReplacable getComputerPowerReplacable;
  final GetComputerCaseReplacable getComputerCaseReplacable;
  final GetComputerMonitorReplacable getComputerMonitorReplacable;
  final GetComputerKeyboardReplacable getComputerKeyboardReplacable;
  final GetComputerMouseReplacable getComputerMouseReplacable;

  RecommendOutputProvider(
      this.getComputerProgramFit,
      this.getBottleneckCPUVGA,
      this.getRecommendOutput,
      this.getComputerCPU,
      this.getComputerVGA,
      this.getComputerRAM,
      this.getComputerMainBoard,
      this.getComputerSSD,
      this.getComputerHDD,
      this.getComputerCooler,
      this.getComputerPower,
      this.getComputerCase,
      this.getComputerMonitor,
      this.getComputerKeyboard,
      this.getComputerMouse,
      this.getComputerCPUReplacable,
      this.getComputerVGAReplacable,
      this.getComputerRAMReplacable,
      this.getComputerMainBoardReplacable,
      this.getComputerSSDReplacable,
      this.getComputerHDDReplacable,
      this.getComputerCoolerReplacable,
      this.getComputerPowerReplacable,
      this.getComputerCaseReplacable,
      this.getComputerMonitorReplacable,
      this.getComputerKeyboardReplacable,
      this.getComputerMouseReplacable);

  late Future<List<RecommendOutput>> results;
  late int purpose;
  List<Future<ComputerCPU>> cpu = [];
  List<Future<ComputerVGA>> vga = [];
  List<Future<ComputerRAM>> ram = [];
  List<Future<ComputerMainBoard>> mainboard = [];
  List<Future<ComputerSSD>> ssd = [];
  List<Future<ComputerHDD>> hdd = [];
  List<Future<ComputerCooler>> cooler = [];
  List<Future<ComputerPower>> power = [];
  List<Future<ComputerCase>> ccase = [];
  List<Future<ComputerMonitor>> monitor = [];
  List<Future<ComputerKeyboard>> keyboard = [];
  List<Future<ComputerMouse>> mouse = [];
  List<Future<double>> bottleneck = [];
  List<Future<List<ProgramFit>>> programFit = [];
  List<Future<int>> totalPrice = [];
  List<String> totalLink = [];
  List<int> numCpu = [];
  List<int> numVga = [];
  List<int> numRam = [];
  List<int> numMainboard = [];
  List<int> numSsd = [];
  List<int> numHdd = [];
  List<int> numCooler = [];
  List<int> numPower = [];
  List<int> numCase = [];
  List<int> numMonitor = [];
  List<int> numKeyboard = [];
  List<int> numMouse = [];

  void setRecommendOutputList(RecommendInput recommendInput) async {
    purpose = recommendInput.purpose;
    results = getRecommendOutput(recommendInput);
    results.then((value) {
      List<RecommendOutput> r = value;
      for (int i = 0; i < r.length; ++i) {
        cpu.add(r[i].numCpu > 0
            ? getComputerCPU(r[i].cpuId)
            : Future.value(NoCPU()));
        vga.add(r[i].numVga > 0
            ? getComputerVGA(r[i].vgaId)
            : Future.value(NoVGA()));
        ram.add(r[i].numRam > 0
            ? getComputerRAM(r[i].ramId)
            : Future.value(NoRAM()));
        mainboard.add(r[i].numMainboard > 0
            ? getComputerMainBoard(r[i].mainboardId)
            : Future.value(NoMainBoard()));
        ssd.add(r[i].numSsd > 0
            ? getComputerSSD(r[i].ssdId)
            : Future.value(NoSSD()));
        hdd.add(r[i].numHdd > 0
            ? getComputerHDD(r[i].hddId)
            : Future.value(NoHDD()));
        cooler.add(r[i].numCooler > 0
            ? getComputerCooler(r[i].coolerId)
            : Future.value(NoCooler()));
        power.add(r[i].numPower > 0
            ? getComputerPower(r[i].powerId)
            : Future.value(NoPower()));
        ccase.add(r[i].numCase > 0
            ? getComputerCase(r[i].caseId)
            : Future.value(NoCase()));
        monitor.add(r[i].numMonitor > 0
            ? getComputerMonitor(r[i].monitorId)
            : Future.value(NoMonitor()));
        keyboard.add(r[i].numKeyboard > 0
            ? getComputerKeyboard(r[i].keyboardId)
            : Future.value(NoKeyboard()));
        mouse.add(r[i].numMouse > 0
            ? getComputerMouse(r[i].mouseId)
            : Future.value(NoMouse()));
        numCpu.add(r[i].numCpu);
        numVga.add(r[i].numVga);
        numRam.add(r[i].numRam);
        numMainboard.add(r[i].numMainboard);
        numSsd.add(r[i].numSsd);
        numHdd.add(r[i].numHdd);
        numCooler.add(r[i].numCooler);
        numPower.add(r[i].numPower);
        numCase.add(r[i].numCase);
        numMonitor.add(r[i].numMonitor);
        numKeyboard.add(r[i].numKeyboard);
        numMouse.add(r[i].numMouse);
        totalPrice.add(Future.value(0));
        setTotalPrice(i);
        bottleneck.add(Future.value(0));
        setBottleneck(i);
        programFit.add(Future.value([]));
        setProgramFit(i);
        totalLink.add("");
        setTotalLink(i);
      }
    });
  }

  int _viewIndex = 0;
  int get viewIndex => _viewIndex;
  set viewIndex(int value) {
    _viewIndex = value;
    notifyListeners();
  }

  void setTotalPrice(int viewIndex) {
    List<int> numItem = [
      numCpu[viewIndex],
      numVga[viewIndex],
      numRam[viewIndex],
      numMainboard[viewIndex],
      numSsd[viewIndex],
      numHdd[viewIndex],
      numCooler[viewIndex],
      numPower[viewIndex],
      numCase[viewIndex],
      numMonitor[viewIndex],
      numKeyboard[viewIndex],
      numMouse[viewIndex],
    ];
    totalPrice[viewIndex] = Future.wait([
      cpu[viewIndex],
      vga[viewIndex],
      ram[viewIndex],
      mainboard[viewIndex],
      ssd[viewIndex],
      hdd[viewIndex],
      cooler[viewIndex],
      power[viewIndex],
      ccase[viewIndex],
      monitor[viewIndex],
      keyboard[viewIndex],
      mouse[viewIndex],
    ]).then(((value) {
      int total = 0;
      int idx = 0;
      for (ComputerItem e in value) {
        total += e.cheapPrice * numItem[idx++];
      }
      return total;
    }));
  }

  void setBottleneck(int viewIndex) {
    bottleneck[viewIndex] =
        Future.wait([cpu[viewIndex], vga[viewIndex]]).then((value) {
      return getBottleneckCPUVGA(value[0].id, value[1].id);
    });
  }

  void setProgramFit(int viewIndex) {
    programFit[viewIndex] = vga[viewIndex].then((value) {
      return getComputerProgramFit(value.id, purpose);
    });
  }

  void setTotalLink(int viewIndex) {
    List<int> itemNum = [
      numCpu[viewIndex],
      numVga[viewIndex],
      numRam[viewIndex],
      numMainboard[viewIndex],
      numSsd[viewIndex],
      numHdd[viewIndex],
      numCooler[viewIndex],
      numPower[viewIndex],
      numCase[viewIndex],
      numMonitor[viewIndex],
      numKeyboard[viewIndex],
      numMouse[viewIndex],
    ];
    Future.wait([
      cpu[viewIndex],
      vga[viewIndex],
      ram[viewIndex],
      mainboard[viewIndex],
      ssd[viewIndex],
      hdd[viewIndex],
      cooler[viewIndex],
      power[viewIndex],
      ccase[viewIndex],
      monitor[viewIndex],
      keyboard[viewIndex],
      mouse[viewIndex]
    ]).then((value) {
      String map1 =
          "https://shop.danawa.com/virtualestimate/?controller=estimateMain&methods=index&marketPlaceSeq=16&logger_kw=dnw_gnb_esti";
      String map2 = "&productSeqList=";
      String map3 = "&quantityList=";
      int i = 0;
      for (ComputerItem e in value) {
        if (e is! NoComputerItem) {
          map2 += "${e.id},";
          map3 += "${itemNum[i]},";
        }
        ++i;
      }
      totalLink[viewIndex] = map1 + map2 + map3;
    });
  }

  void setPartsCPUNum(int cnt) {
    numCpu[viewIndex] = cnt;
    if (cnt == 0) {
      cpu[viewIndex] = Future.value(NoCPU());
    }
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setPartsVGANum(int cnt) {
    numVga[viewIndex] = cnt;
    if (cnt == 0) {
      vga[viewIndex] = Future.value(NoVGA());
    }
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setPartsRAMNum(int cnt) {
    numRam[viewIndex] = cnt;
    if (cnt == 0) {
      ram[viewIndex] = Future.value(NoRAM());
    }
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setPartsMainboardNum(int cnt) {
    numMainboard[viewIndex] = cnt;
    if (cnt == 0) {
      mainboard[viewIndex] = Future.value(NoMainBoard());
    }
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setPartsSSDNum(int cnt) {
    numSsd[viewIndex] = cnt;
    if (cnt == 0) {
      ssd[viewIndex] = Future.value(NoSSD());
    }
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setPartsHDDNum(int cnt) {
    numHdd[viewIndex] = cnt;
    if (cnt == 0) {
      hdd[viewIndex] = Future.value(NoHDD());
    }
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setPartsCoolerNum(int cnt) {
    numCooler[viewIndex] = cnt;
    if (cnt == 0) {
      cooler[viewIndex] = Future.value(NoCooler());
    }
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setPartsPowerNum(int cnt) {
    numPower[viewIndex] = cnt;
    if (cnt == 0) {
      power[viewIndex] = Future.value(NoPower());
    }
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setPartsCaseNum(int cnt) {
    numCase[viewIndex] = cnt;
    if (cnt == 0) {
      ccase[viewIndex] = Future.value(NoCase());
    }
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setPartsMonitorNum(int cnt) {
    numMonitor[viewIndex] = cnt;
    if (cnt == 0) {
      monitor[viewIndex] = Future.value(NoMonitor());
    }
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setPartsKeyboardNum(int cnt) {
    numKeyboard[viewIndex] = cnt;
    if (cnt == 0) {
      keyboard[viewIndex] = Future.value(NoKeyboard());
    }
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setPartsMouseNum(int cnt) {
    numMouse[viewIndex] = cnt;
    if (cnt == 0) {
      mouse[viewIndex] = Future.value(NoMouse());
    }
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setCPU(Future<ComputerCPU> item) {
    cpu[viewIndex] = item;
    numCpu[viewIndex] = 1;
    setTotalPrice(viewIndex);
    setBottleneck(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setVGA(Future<ComputerVGA> item) {
    vga[viewIndex] = item;
    numVga[viewIndex] = 1;
    setTotalPrice(viewIndex);
    setBottleneck(viewIndex);
    setProgramFit(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setRAM(Future<ComputerRAM> item) {
    ram[viewIndex] = item;
    numRam[viewIndex] = 1;
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setMainboard(Future<ComputerMainBoard> item) {
    mainboard[viewIndex] = item;
    numMainboard[viewIndex] = 1;
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setSSD(Future<ComputerSSD> item) {
    ssd[viewIndex] = item;
    numSsd[viewIndex] = 1;
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setHDD(Future<ComputerHDD> item) {
    hdd[viewIndex] = item;
    numHdd[viewIndex] = 1;
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setCooler(Future<ComputerCooler> item) {
    cooler[viewIndex] = item;
    numCooler[viewIndex] = 1;
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setPower(Future<ComputerPower> item) {
    power[viewIndex] = item;
    numPower[viewIndex] = 1;
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setCase(Future<ComputerCase> item) {
    ccase[viewIndex] = item;
    numCase[viewIndex] = 1;
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setMonitor(Future<ComputerMonitor> item) {
    monitor[viewIndex] = item;
    numMonitor[viewIndex] = 1;
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setKeyboard(Future<ComputerKeyboard> item) {
    keyboard[viewIndex] = item;
    numKeyboard[viewIndex] = 1;
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  void setMouse(Future<ComputerMouse> item) {
    mouse[viewIndex] = item;
    numMouse[viewIndex] = 1;
    setTotalPrice(viewIndex);
    setTotalLink(viewIndex);
    notifyListeners();
  }

  Future<List<Future<ComputerCPU>>> getCPUReplacable() {
    Future<List<Future<ComputerCPU>>> result =
        mainboard[viewIndex].then((value) {
      Future<List<int>> ids = getComputerCPUReplacable(
          value is! NoMainBoard ? value.cpuSocket : "a");
      return ids.then(
        (value) {
          List<Future<ComputerCPU>> items = [];
          for (int id in value) {
            items.add(getComputerCPU(id));
          }
          return items;
        },
      );
    });
    return result;
  }

  Future<List<Future<ComputerVGA>>> getVGAReplacable() {
    Future<List<Future<ComputerVGA>>> result = power[viewIndex].then((value) {
      Future<List<int>> ids =
          getComputerVGAReplacable(value is! NoPower ? value.staticPower : 0);
      return ids.then(
        (value) {
          List<Future<ComputerVGA>> items = [];
          for (int id in value) {
            items.add(getComputerVGA(id));
          }
          return items;
        },
      );
    });
    return result;
  }

  Future<List<Future<ComputerRAM>>> getRAMReplacable() {
    Future<List<Future<ComputerRAM>>> result =
        mainboard[viewIndex].then((value) {
      Future<List<int>> ids = getComputerRAMReplacable(
          value is! NoMainBoard ? value.memoryType : "a");
      return ids.then(
        (value) {
          List<Future<ComputerRAM>> items = [];
          for (int id in value) {
            items.add(getComputerRAM(id));
          }
          return items;
        },
      );
    });
    return result;
  }

  Future<List<Future<ComputerMainBoard>>> getMainboardReplacable() {
    Future<List<Future<ComputerMainBoard>>> result =
        Future.wait([cpu[viewIndex], ram[viewIndex]]).then((value) {
      Future<List<int>> ids = getComputerMainBoardReplacable(
          value[0] is! NoCPU ? (value[0] as ComputerCPU).socket : "a",
          value[1] is! NoRAM ? (value[1] as ComputerRAM).category : "a");
      return ids.then(
        (value) {
          List<Future<ComputerMainBoard>> items = [];
          for (int id in value) {
            items.add(getComputerMainBoard(id));
          }
          return items;
        },
      );
    });
    return result;
  }

  Future<List<Future<ComputerSSD>>> getSSDReplacable() {
    Future<List<int>> ids = getComputerSSDReplacable();
    return ids.then(
      (value) {
        List<Future<ComputerSSD>> items = [];
        for (int id in value) {
          items.add(getComputerSSD(id));
        }
        return items;
      },
    );
  }

  Future<List<Future<ComputerHDD>>> getHDDReplacable() {
    Future<List<int>> ids = getComputerHDDReplacable();
    return ids.then(
      (value) {
        List<Future<ComputerHDD>> items = [];
        for (int id in value) {
          items.add(getComputerHDD(id));
        }
        return items;
      },
    );
  }

  Future<List<Future<ComputerCooler>>> getCoolerReplacable() {
    Future<List<int>> ids = getComputerCoolerReplacable();
    return ids.then(
      (value) {
        List<Future<ComputerCooler>> items = [];
        for (int id in value) {
          items.add(getComputerCooler(id));
        }
        return items;
      },
    );
  }

  Future<List<Future<ComputerPower>>> getPowerReplacable() {
    Future<List<Future<ComputerPower>>> result = vga[viewIndex].then((value) {
      Future<List<int>> ids =
          getComputerPowerReplacable(value is! NoVGA ? value.requiredPower : 0);
      return ids.then(
        (value) {
          List<Future<ComputerPower>> items = [];
          for (int id in value) {
            items.add(getComputerPower(id));
          }
          return items;
        },
      );
    });
    return result;
  }

  Future<List<Future<ComputerCase>>> getCaseReplacable() {
    Future<List<int>> ids = getComputerCaseReplacable();
    return ids.then(
      (value) {
        List<Future<ComputerCase>> items = [];
        for (int id in value) {
          items.add(getComputerCase(id));
        }
        return items;
      },
    );
  }

  Future<List<Future<ComputerMonitor>>> getMonitorReplacable() {
    Future<List<int>> ids = getComputerMonitorReplacable();
    return ids.then(
      (value) {
        List<Future<ComputerMonitor>> items = [];
        for (int id in value) {
          items.add(getComputerMonitor(id));
        }
        return items;
      },
    );
  }

  Future<List<Future<ComputerKeyboard>>> getKeyboardReplacable() {
    Future<List<int>> ids = getComputerKeyboardReplacable();
    return ids.then(
      (value) {
        List<Future<ComputerKeyboard>> items = [];
        for (int id in value) {
          items.add(getComputerKeyboard(id));
        }
        return items;
      },
    );
  }

  Future<List<Future<ComputerMouse>>> getMouseReplacable() {
    Future<List<int>> ids = getComputerMouseReplacable();
    return ids.then(
      (value) {
        List<Future<ComputerMouse>> items = [];
        for (int id in value) {
          items.add(getComputerMouse(id));
        }
        return items;
      },
    );
  }
}
