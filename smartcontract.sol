// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MoneyTransfer {
    // Mapping to track user balances
    mapping(address => uint256) public balances;

    // Function to deposit Ether into the contract
    function deposit() public payable {
        // Ensure the deposit amount is greater than zero
        require(msg.value > 0, "Deposit amount must be greater than zero");
        
        // Update the sender's balance
        balances[msg.sender] += msg.value;
    }

    // Function to withdraw Ether from the contract
    function withdraw(uint256 amount) public {
        // Ensure the sender has enough balance to withdraw
        require(balances[msg.sender] >= amount, "Insufficient funds for withdrawal");

        // Update the sender's balance before transferring to prevent re-entrancy attacks
        balances[msg.sender] -= amount;

        // Transfer the amount to the sender
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");
    }

    // Function to transfer Ether to another address
    function transfer(address recipient, uint256 amount) public {
        // Ensure the sender has enough balance to transfer
        require(balances[msg.sender] >= amount, "Insufficient funds for transfer");

        // Ensure the recipient address is valid
        require(recipient != address(0), "Cannot send funds to zero address");

        // Update balances
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }
}
