//SPDX-License-Identifier: MIT

pragma solidity 0.8.21;

contract GrandFather {
    string public uint_G_Father;

    function setMyString(string memory a) public virtual {
        uint_G_Father = a;
    }
}

contract Father is GrandFather {
    string public uint_father;

    function setMyString(string memory a) public virtual override {
        uint_father = a;
         super.setMyString("G_father from father con");
    }
}

contract Mother is GrandFather {
    string public uint_mother;

    function setMyString(string memory a) public virtual override {
        uint_mother = a;
        //won't call its parents function rather it will the next contract in the inheritance tree
        //https://docs.soliditylang.org/en/latest/contracts.html#inheritance
        super.setMyString("G_father from mother con");
    }
}

contract Child is Father,Mother {
    string public uint_child;
/*  inheritance sequence
    Start most derived contract: Child -> Mother-> Father -> GrandFather */
    function setMyString(string memory a) public override(Father,Mother) {
        uint_child = a;
        //call the parents function
        Mother.setMyString("father");
        /* this will crate an infnite loop of f() calls! 
        this.setMyString(a);
        */
    }
}
