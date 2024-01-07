//SPDX-License-Identifier: MIT

pragma solidity 0.8.21;

contract Father {
    uint256 public uint_father;
    constructor (uint num){
        uint_father = num;
    }

    function setfather_uint(uint256 a) external {
        uint_father = a;
    }

     function override_able_func (uint256 o) external virtual  {
        uint_father = o;
    }
}

contract Mother {
    uint256 public uint_mother;
    constructor(){
        uint_mother = 0;
    }
    function setMother_uint(uint256 a) external {
        uint_mother = a;
    }

     function override_able_func (uint256 o) external virtual  {
        uint_mother = o;
    }
}

contract Child is Father, Mother {
    uint256 public uint_child;
   /*  WE HAVE TO INITIALIZE THE parents {Fathers's} constructors argument 
      in this child constructor's argument 
      AS the parent constructors requires an argument */


    constructor() Father(4) Mother(){}
    /* other parent does have a constructor but with no argument;
    so we don't need to intilize it in the Child */

    function child_setNum(uint256 c) external {
        //accessing parents variable
        uint_father = c;
        uint_mother = c;
    }

    //OVER-RIDING THE parent's FUNCTION
    /* 
        you have to specify all base contracts that define the same function and 
        have not yet been overridden by another base contract.
        https://docs.soliditylang.org/en/latest/contracts.html#function-overriding
     */
     function override_able_func (uint256 o) external override (Mother,Father) {
        uint_mother = o;
    }
}
