class RecommendInput {
  bool priorIntelCPU;
  bool priorAMDCPU;
  String purpose; // {'office', 'game', 'graphic'}
  int priceLow; // ex) 250000
  int priceHigh; // ex) 9999999

  RecommendInput({
    this.priorIntelCPU = false,
    this.priorAMDCPU = false,
    this.purpose = '',
    this.priceLow = 0,
    this.priceHigh = 0,
  });
}
