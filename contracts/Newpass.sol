//SPDX-License-Identifier: Undefined



pragma solidity ^0.8.0;



import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

interface NakamigosContracts{
    function tokensOfOwner(address owner) external view returns (uint256[] memory);
}

contract NewPass is ERC721 {
    
    address public nakaAddress = 0xd774557b647330C91Bf44cfEAB205095f7E6c367;

    uint16 counter = 0;

    mapping(address => bool) public passIssued;
    
    

    constructor() ERC721("ExampleTokens", "EXt") {
        
    }

    function newToken() external returns(bool) {
        require(msg.sender != address(0), "Not a valid address");
        uint256[] memory arr = NakamigosContracts(nakaAddress).tokensOfOwner(msg.sender); 
        require(arr.length >= 1, "You have no nakamigos NFTs");

        uint256 newTokenId = counter++;
        _mint(msg.sender ,newTokenId);
        tokenURI(newTokenId);
        passIssued[msg.sender] = true;

        return true;

    }

}