# Overview:
The Auction contract is a smart contract that allows users to place bids, view current bids, and cancel auction items. It includes basic error handling using require, assert, and revert statements to ensure proper operation and provide meaningful error messages.
# Features:
1. Place a bid with the placeBid function.
2. View the current bid for a specific address using the getCurrentBid function.
3. Cancel an auction item using the cancelItem function.
# Error Handling:
1. **Invalid Bidder:** The placeBid function will revert with "Invalid bidder" if the bidder's address is invalid.
2. **Zero Amount:** The placeBid function will revert with an assertion error if the bid amount is zero.
3. **Non-Existent Item:** The getCurrentBid and cancelItem functions will revert with "Item does not exist" if there is no bid for the specified address.
4. **Auction Cancellation:** The cancelItem function will revert with "Auction item cancelled. All bids will be refunded." to indicate the item has been canceled.
