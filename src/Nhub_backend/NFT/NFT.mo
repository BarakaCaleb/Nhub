actor class NFT(
  id: Text,
  owner: Principal,
  metadata: Text,
  mutable isListed: Bool,
  mutable price: Nat,
  mutable isLocked: Bool
) {
  public func getId(): Text { id };
  public func getOwner(): Principal { owner };

  public func transfer(newOwner: Principal): async Bool {
    if (isListed and not isLocked) {
      owner := newOwner;
      isListed := false;
      return true;
    };
    return false;
  };

  public func listForSale(price: Nat): async Bool {
    isListed := true;
    self.price := price;
    return true;
  };

  public func lockForCrossChain(): async Bool {
    isLocked := true;
    return true;
  };

  public func unlockFromCrossChain(newOwner: Principal): async Bool {
    isLocked := false;
    owner := newOwner;
    return true;
  };
};
