class RecommendInput {
  bool priorIntelCPU;
  bool priorAMDCPU;
  int purpose; // {'office', 'game', 'graphic'}
  int priceLow; // ex) 250000
  int priceHigh; // ex) 9999999

  RecommendInput({
    this.priorIntelCPU = true,
    this.priorAMDCPU = true,
    this.purpose = 1,
    this.priceLow = 500000,
    this.priceHigh = 700000,
  });
}
