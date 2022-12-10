class RecommendInput {
  bool priorIntelCPU;
  bool priorAMDCPU;
  int purpose; // {'office', 'game', 'graphic'}
  int priceLow; // ex) 250000
  int priceHigh; // ex) 9999999

  RecommendInput({
    this.priorIntelCPU = false,
    this.priorAMDCPU = false,
    this.purpose = 0,
    this.priceLow = 0,
    this.priceHigh = 0,
  });
}
