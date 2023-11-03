// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTContract is ERC721 {
    address public owner;
    uint256 public experienceId;
    
    constructor() ERC721("TravelExperienceNFT", "EXP") {
        owner = msg.sender;
    }
    
    function createNFT(string memory _tokenURI) public {
        require(msg.sender == owner, "Only the owner can create NFTs");
        _mint(msg.sender, experienceId);
        _setTokenURI(experienceId, _tokenURI);
        experienceId++;
    }
    
    function tradeNFT(address _from, address _to, uint256 _tokenId) public {
        require(_isApprovedOrOwner(_from, _tokenId), "You are not the owner");
        safeTransferFrom(_from, _to, _tokenId, "");
    }
}
