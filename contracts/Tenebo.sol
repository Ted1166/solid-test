// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Tenebo {
    struct Marafiki {
         uint userId;
         string fullName;
         address username;
         uint256 timestamp;
    }

    Marafiki[] public users;
    uint public userId;

    constructor(){
       userId = 1;
    }


    function addAdopterInfo(
        string memory _fullName,
        address _username

    ) public{
       users.push(Marafiki(userId, _fullName, _username, block.timestamp));
       userId++;
    }

   function getAdopter
qeq-hrqr-esh