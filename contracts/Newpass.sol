//SPDX-License-Identifier: Undefined



pragma solidity ^0.8.0;



import "@openzeppelin/contracts/token/ERC721/ERC721.sol";



// interface NakamigosContracts{
//     function tokensOfOwner(address owner) external view returns (uint256[] memory);
    
// }

interface NakamigosContractInterface{
    function tokensOfOwner(address owner) external view returns (uint256[] memory);
}

contract NewPass is ERC721 {
    
    // address public nakaAddress;

    uint16 counter = 0;

    address public NakamigosContractAddress = 0xd774557b647330C91Bf44cfEAB205095f7E6c367;

    mapping(address => bool) public passIssued;
    
    

    constructor() ERC721("ExampleTokens", "EXt") {
        
    }

    // function holdsNaka(address _to) public view returns(bool){
    //     uint[] memory arr = NakamigosContracts(nakaAddress).tokensOfOwner(_to);
    //     if(arr.length >= 1){
    //         return true;
    //     }
    //     else{
    //         return false;
    //     }
    //  }

     function holdsNakaNFTs(address _to) public view returns(bool){
        // address add = 0xc2d118a11ccE453Ac65310C80286594228bBAf1d;
        uint[] memory arr = NakamigosContractInterface(NakamigosContractAddress).tokensOfOwner(_to);
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
        // bool holdsNakaTokens = holdsNaka(msg.sender);
        bool holdsNakaNFT = holdsNakaNFTs(msg.sender);
        // require(holdsNakaTokens == true, "You have no nakamigos NFTs");
        require(holdsNakaNFT == true, "You have no nakamigos NFTs");

        uint256 newTokenId = counter++;
        _mint(msg.sender ,newTokenId);
        tokenURI(newTokenId);
        passIssued[msg.sender] = true;

        return true;
    }

    function passIssedToAdress(address _to) external view returns(bool){
        return passIssued[_to];
    } 



}