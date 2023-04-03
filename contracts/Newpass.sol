//SPDX-License-Identifier: Undefined



pragma solidity ^0.8.0;



import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

interface NakamigosContracts{
    function tokensOfOwner(address owner) external view returns (uint256[] memory);
}

contract NewPass is ERC721 {
    
    address public nakaAddress;

    uint16 counter = 0;

    mapping(address => bool) public passIssued;
    
    

    constructor(address _nakaAddress) ERC721("ExampleTokens", "EXt") {
        nakaAddress = _nakaAddress;
    }

    function holdsNaka(address _to) public view returns(bool){
        uint[] memory arr = NakamigosContracts(nakaAddress).tokensOfOwner(_to);
        if(arr.length >= 1){
            return true;
        }
        else{
            return false;
        }
     }

    function newToken() external returns(bool) {
        require(msg.sender != address(0), "Not a valid address");
        require(passIssued[msg.sender] == false, "pass already issed");
        bool holdsNakaTokens = holdsNaka(msg.sender);
        require(holdsNakaTokens == true, "You have no nakamigos NFTs");

        uint256 newTokenId = counter++;
        _mint(msg.sender ,newTokenId);
        tokenURI(newTokenId);
        passIssued[msg.sender] = true;

        return true;

    }

}