// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTContract is ERC721Enumerable, Ownable {
    string public baseTokenURI;
    uint256 private _tokenIdCounter;

    constructor(string memory _name, string memory _symbol, string memory _baseTokenURI) ERC721(_name, _symbol) {
        baseTokenURI = _baseTokenURI;
        _tokenIdCounter = 0;
    }

    function setBaseURI(string memory _baseTokenURI) public onlyOwner {
        baseTokenURI = _baseTokenURI;
    }

    function mintNFT(address recipient) public onlyOwner {
        _tokenIdCounter = _tokenIdCounter + 1;
        _mint(recipient, _tokenIdCounter);
    }

    function mintMultipleNFTs(address recipient, uint256 numberOfTokens) public onlyOwner {
        require(numberOfTokens > 0, "Number of tokens must be greater than 0");
        for (uint256 i = 0; i < numberOfTokens; i++) {
            _tokenIdCounter = _tokenIdCounter + 1;
            _mint(recipient, _tokenIdCounter);
        }
    }

    function _baseURI() internal view override returns (string memory) {
        return baseTokenURI;
    }
}
