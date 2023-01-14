// SPDX-License-Identifier: GPL-3.0

//version of solidity
pragma solidity ^0.8.1;

// Contract 1 : containing the sending functionality and receiving functionality
contract Contract1{

    //address of other contract
    address payable public receiver_address;

    // function setAddress to set an address for the contract
    // and this is must set to the address of other contract
    function setAddress(address a) public payable{
        receiver_address = payable(a);
    }

    // default constructor
    constructor() payable{
    }

    // sending function
    function sendToReceiver(uint v) public{

        //assert to validate that the balance is greater than or equal the sent value
        assert(address(this).balance>=v);

        // send function
        receiver_address.send(v);
    }

    // transferring function
    function transferToReceiver(uint v) public{

        //assert to validate that the balance is greater than or equal the transferred value
        assert(address(this).balance>=v);

        //transfer function
        receiver_address.transfer(15);
    }

    // calling function
    function callToReceiver(uint v) public{

        //assert to validate that the balance is greater than or equal the called value
        assert(address(this).balance>=v);

        // call function
        (bool success , bytes memory data) = receiver_address.call{value:v}("");
    }
    
    // function that returns a balance of this contract
    function getMyBalance() public view returns(uint){
        return address(this).balance;
    }

    // recive function
    receive() external payable{
    }

    // fallback function in the case of non_excisting of a reciver function
    fallback() external payable{
    }
}

// Contract2 : containing the sending functionality and receiving functionality
contract Contract2{
    
    // address of other contract
    address payable public receiver_address;

    // function setAddress to set an address for the contract
    // and this is must set to the address of other contract
    function setAddress(address a) public payable{
        receiver_address = payable(a);
    }

    // default constructor
    constructor() payable{
    }

    // sending function
    function sendToReceiver(uint v) public{

        //assert to validate that the balance is greater than or equal the sent value
        assert(address(this).balance>=v);

        // send function
        receiver_address.send(v);
    }

    // transferring function
    function transfeToReceiver(uint v) public{

        //assert to validate that the balance is greater than or equal the transferred value
        assert(address(this).balance>=v);

        //transfer function
        receiver_address.transfer(15);
    }

    // calling function
    function callToReceiver(uint v) public{

        //assert to validate that the balance is greater than or equal the called value
        assert(address(this).balance>=v);

        // call function
        (bool success , bytes memory data) = receiver_address.call{value:v}("");
    }
    
    // function that returns a balance of this contract
    function getMyBalance() public view returns(uint){
        return address(this).balance;
    }
    receive() external payable{
    }

    // fallback function in the case of non_exsisting of a reciver function
    fallback() external payable{
    }
}