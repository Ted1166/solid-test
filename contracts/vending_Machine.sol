// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract vending_Machine {
  address public owner;
  mapping (address => uint) public donutBalances;

  constructor() {
    owner = msg.sender;
    donutBalances[address(this)] = 100;
  }

  function getvendingmachineBalance() public view returns(uint) {
    return donutBalances[address(this)];
  }

  function restock(uint amount) public {
    require(msg.sender == owner, "only the owner can restock this machine");
    donutBalances[address(this)] += amount;
  }

  function purchase(uint amount) public payable {
    require(msg.value >= amount * 2 ether, "you must pay atleast 2 ether per donut");
    require(donutBalances[address(this)] >= amount, "not enough donuts to purchase request");
    donutBalances[address(this)] -= amount;
    donutBalances[msg.sender] += amount;
  }
}
