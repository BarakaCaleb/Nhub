import NFT "dfx-generated/NFT";

actor Marketplace {
  stable var nfts: [NFT] = [];

  public func mintNFT(metadata: Text, owner: Principal): async NFT {
    let newNFT = NFT("NFT_ID", owner, metadata, false, 0, false);
    nfts := Array.append(nfts, [newNFT]);
    return newNFT;
  };

  public func listNFT(nftId: Text, price: Nat): async Bool {
    for (nft in nfts.vals()) {
      if (nft.getId() == nftId) {
        return await nft.listForSale(price);
      };
    };
    return false;
  };

  public func transferNFT(nftId: Text, newOwner: Principal): async Bool {
    for (nft in nfts.vals()) {
      if (nft.getId() == nftId) {
        return await nft.transfer(newOwner);
      };
    };
    return false;
  };
};
