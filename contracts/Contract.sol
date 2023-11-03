// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Greeting {
    string public greetingMessage;

    constructor(string memory initialMessage) {
        greetingMessage = initialMessage;
    }

    function setGreeting(string memory newMessage) public {
        greetingMessage = newMessage;
    }

    function getGreeting() public view returns (string memory) {
        return greetingMessage;
    }
}
