// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MoneyTransfer {
    // Mapping to track user balances
    mapping(address => uint256) public balances;

    // Event emitted on successful deposit
    event Deposit(address indexed sender, uint256 amount);

    // Event emitted on successful withdrawal
    event Withdrawal(address indexed recipient, uint256 amount);

    // Function to deposit Ether into the contract
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");

        // Update sender's balance
        balances[msg.sender] += msg.value;

        emit Deposit(msg.sender, msg.value);
    }

    // Function to withdraw Ether from the contract
    function withdraw(uint256 amount) public {
        require(amount > 0, "Withdrawal amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient funds for withdrawal");

        // Update balances
        balances[msg.sender] -= amount;

        // Transfer Ether to the recipient
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");

        emit Withdrawal(msg.sender, amount);
    }

    // Function to transfer Ether to another address
    function transfer(address recipient, uint256 amount) public {
        require(recipient != address(0), "Cannot send funds to zero address");
        require(amount > 0, "Transfer amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient funds for transfer");

        // Update balances
        balances[msg.sender] -= amount;
        balances[recipient] += amount;

        emit Withdrawal(recipient, amount);
    }
}
