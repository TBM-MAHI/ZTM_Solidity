//SPDX-License-Identifier: MIT

pragma solidity 0.8.21;

contract GrandFather {
    uint256 public uint_G_Father;
    uint internal internal_uint;

    function setGrand_Father_uint(uint256 a) external {
        uint_G_Father = a;
    }
}
/* INSECT IN ACTION */
contract Father is GrandFather{
    uint256 public uint_father;

    function setfather_uint(uint256 a) external {
        uint_father = a;
    }
}

contract Mother is GrandFather{
    uint256 public uint_mother;
    function setMother_uint(uint256 a) external {
        uint_mother = a;
    }
}

contract Child is Father,Mother {
    uint256 public uint_child;

    function child_setNum(uint256 c) external {
        //accessing both parents variable
        uint_G_Father = c;
        uint_father = c;
        uint_mother = c;
        //accessing internal variables
        internal_uint = c;
    }
}
