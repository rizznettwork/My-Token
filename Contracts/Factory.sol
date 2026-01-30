// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Factory {
    address public lastPair;

    function createPair(address tokenA, address tokenB) external returns (address) {
        lastPair = address(uint160(uint(keccak256(abi.encodePacked(tokenA, tokenB, block.timestamp)))));
        return lastPair;
    }
}
