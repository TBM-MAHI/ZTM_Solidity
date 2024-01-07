//SPDX-License-Identifier: MIT

pragma solidity 0.8.21;

contract GrandFather {
    string public uint_G_Father;

    constructor(string memory m){
        uint_G_Father = m;
    }
}

/* abstract contracts cannot be DEPLOYED 
there fore cannot have constructors*/
abstract contract Father is GrandFather {
    string father_string;

    //
 /*   constructor(string memory s){
    father_string=s;
   } */
}


contract Child is Father {
    string public uint_child;

    constructor(string memory s) GrandFather(s){}
}
