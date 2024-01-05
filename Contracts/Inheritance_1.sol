//SPDX-License-Identifier: MIT

pragma solidity 0.8.21;

contract Parent {
    uint256 public uint_parent;

    function setParent_uint(uint a)  external {
        uint_parent = a;
    }
}

contract Child is Parent{
      uint256 public uint_child;
}