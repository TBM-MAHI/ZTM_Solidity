//SPDX-License-Identifier: MIT

pragma solidity 0.8.21;

contract publicAndPrivateState {
    // the Default visibity of variable is INTERNAL
    uint256 number1 = 781;
    uint256 public number2 = 782;
    //public declaration will automatically create the // getNumber1()  functions
    
    function getNumber1() external view returns (uint256) {
        return number1;
    }
     function setNumber1(uint n) external  {
        number1 = n;
    }
}

contract myContract {
    uint256 nyNumber;
    //THIS IS A NORMAL FUNCTION
    function  setNumber(uint256 a) public  {
        nyNumber=a;
    }

    //THIS IS A VIEW FUNCTION
    function getNumber() public view returns (uint256) {
        return  nyNumber;
    }
    //PURE functions IS a FORM OF VIEW FUNCTION
    function getRandom() private  pure returns(uint256){
        return 5;
    }
    function payMeBackLess() external  payable {
      uint refundAmount = msg.value/getRandom();
      payable(msg.sender).transfer(refundAmount);
    }
} 
