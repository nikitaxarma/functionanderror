// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Auction {
  mapping(address => uint256) public bids;
  event NewBid(address bidder, uint256 amount);

  function placeBid(uint256 amount) public {
    require(msg.sender != address(0), "Invalid bidder");
    assert(amount > 0);
    bids[msg.sender] = amount;
    emit NewBid(msg.sender, amount);
  }

  function getCurrentBid(address item) public view returns (uint256) {
    require(bids[item] > 0, "Item does not exist");
    return bids[item];
  }
  function cancelItem(address item) public  view {
    require(bids[item] > 0, "Item does not exist");
    // Instead of generic revert, provide specific message for cancelled auction
    revert("Auction item cancelled. All bids will be refunded.");  
  }
}
//0x583031D1113aD414F02576BD6afaBfb302140225
