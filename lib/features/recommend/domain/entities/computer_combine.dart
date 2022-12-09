class RecommendOutput {
  int cpuId;
  int vgaId;
  int ramId;
  int mainboardId;
  int ssdId;
  int hddId;
  int coolerId;
  int powerId;
  int caseId;
  int numCpu;
  int numVga;
  int numRam;
  int numMainboard;
  int numSsd;
  int numHdd;
  int numCooler;
  int numPower;
  int numCase;
  int totalPrice;
  String totalLink;

  RecommendOutput({
    required this.cpuId,
    required this.vgaId,
    required this.ramId,
    required this.mainboardId,
    required this.ssdId,
    required this.hddId,
    required this.coolerId,
    required this.powerId,
    required this.caseId,
    required this.numCpu,
    required this.numVga,
    required this.numRam,
    required this.numMainboard,
    required this.numSsd,
    required this.numHdd,
    required this.numCooler,
    required this.numPower,
    required this.numCase,
    required this.totalPrice,
    required this.totalLink,
  });
}
