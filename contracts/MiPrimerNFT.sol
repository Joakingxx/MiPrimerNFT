// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

import { Base64 } from "./libraries/Base64.sol";
//Heredamos los metodos del contrato que importamos arriba.
contract MiPrimerNFT is ERC721URIStorage {
    
   using Counters for Counters.Counter;
   Counters.Counter private _tokenIds;

  string baseSvg = "<svg xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMinYMin meet' viewBox='0 0 350 350'><style>.base { fill: white; font-family: serif; font-size: 24px; }</style><rect width='100%' height='100%' fill='black' /><text x='50%' y='50%' class='base' dominant-baseline='middle' text-anchor='middle'>";

  string[] firstWords = ["NeymarJr", "Mane", "Sterling", "Insigne", "Hazard", "Oyarzabal"];
  string[] secondWords = ["Lewandowski", "Ronaldo", "Mbappe", "Kane", "Suarez", "Haaland"];
  string[] thirdWords = ["Messi", "Salah", "Di Maria", "Mahrez", "Ziyech", "Chiesa"];

event NewEpicNFTMinted(address sender, uint256 tokenId);

  constructor() ERC721 ("LosMejoresDelanterosNFT", "LOSMEJORESDELANTEROS"){
       console.log("Este es mi contrato NFT");
        
   }
   
   // Funcion para elegir una palabra random del array.
  function pickRandomFirstWord(uint256 tokenId) public view returns (string memory) {
     
    uint256 rand = random(string(abi.encodePacked("FIRST_WORD", Strings.toString(tokenId))));
    
    rand = rand % firstWords.length;
    return firstWords[rand];
  }

  function pickRandomSecondWord(uint256 tokenId) public view returns (string memory) {
    uint256 rand = random(string(abi.encodePacked("SECOND_WORD", Strings.toString(tokenId))));
    rand = rand % secondWords.length;
    return secondWords[rand];
  }


  function pickRandomThirdWord(uint256 tokenId) public view returns (string memory) {
    uint256 rand = random(string(abi.encodePacked("THIRD_WORD", Strings.toString(tokenId))));
    rand = rand % thirdWords.length;
    return thirdWords[rand];
  }



  function random(string memory input) internal pure returns (uint256) {
      
      return uint256(keccak256(abi.encodePacked(input)));
  }

function makeAnEpicNFT() public {

    uint256 newItemId = _tokenIds.current();

    string memory first = pickRandomFirstWord(newItemId);
    string memory second = pickRandomSecondWord(newItemId);
    string memory third = pickRandomThirdWord(newItemId);
    string memory combinedWord = string(abi.encodePacked(first, second, third));
    
    string memory finalSvg = string(abi.encodePacked(baseSvg, first, second, third, "</text></svg>"));

   string memory json = Base64.encode(
        bytes(
            string(
                abi.encodePacked(
                    '{"name": "',
                    combinedWord,
                    '", "description": "Delantera de futbol al azar", "image": "data:image/svg+xml;base64,',
                    Base64.encode(bytes(finalSvg)),
                    '"}'
                )
            )
        )
    );

   string memory finalTokenUri = string(
    abi.encodePacked("data:application/json;base64,", json)
);

console.log("\n--------------------");
console.log(
    string(
        abi.encodePacked(
            "https://nftpreview.0xdev.codes/?code=",
            finalTokenUri
        )
    )
);
console.log("--------------------\n");
console.log(finalTokenUri);
console.log("--------------------\n");

_safeMint(msg.sender, newItemId);

    
_setTokenURI(newItemId, finalTokenUri);

_tokenIds.increment();

emit NewEpicNFTMinted(msg.sender, newItemId);

    }
}



