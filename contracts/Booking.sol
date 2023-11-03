// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BookingContract {
    address public owner;
    
    struct TravelExperience {
        string name;
        uint256 price;
        uint256 availability;
    }
    
    TravelExperience[] public travelExperiences;
    mapping(uint256 => address) public bookedBy;
    
    constructor() {
        owner = msg.sender;
    }

    function addTravelExperience(string memory _name, uint256 _price, uint256 _availability) public {
        require(msg.sender == owner, "Only the owner can add experiences");
        travelExperiences.push(TravelExperience(_name, _price, _availability));
    }
    
    function bookExperience(uint256 _experienceId) public payable {
        require(_experienceId < travelExperiences.length, "Invalid experience ID");
        require(msg.value >= travelExperiences[_experienceId].price, "Insufficient payment");
        require(travelExperiences[_experienceId].availability > 0, "No availability");
        travelExperiences[_experienceId].availability--;
        bookedBy[_experienceId] = msg.sender;
    }
    
    function getExperienceAvailability(uint256 _experienceId) public view returns (uint256) {
        require(_experienceId < travelExperiences.length, "Invalid experience ID");
        return travelExperiences[_experienceId].availability;
    }
}
