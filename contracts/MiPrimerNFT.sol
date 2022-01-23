// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

//Heredamos los metodos del contrato que importamos arriba.
contract MiPrimerNFT is ERC721URIStorage {

   using Counters for Counters.Counter;
   Counters.Counter private _tokenIds;

   constructor() ERC721 ("CuadradoNFT", "CUADRADO"){
       console.log("Este es mi contrato NFT");
   }
function makeAnEpicNFT() public {

    uint 256 newItemId = _tokenIds.current()

    _safeMint(msg.sender, newItemId);
    
    _setTokenURI(newItemId, "https://jsonkeeper.com/b/CA01");

    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

    _tokensIds.increment();

    }
}

