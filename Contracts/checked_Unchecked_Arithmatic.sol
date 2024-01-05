//SPDX-License-Identifier: MIT

pragma solidity 0.8.21;

contract Checked {
    uint256 public max_uint = type(uint256).max;
    uint256 public min_uint = type(uint256).min;
    int256 public min_int = type(int256).min;
    int256 public max_int = type(int256).max;

    function checkedAdd() external pure returns (uint256) {
        return type(uint256).max + 1;
    }

    function checkedSub() external pure returns (uint256) {
        return type(uint256).min - 1;
    }

    function checkedDivision() external pure returns (int256) {
        /* range[ -2*256...0...*256-1 ] 
        
         revert negative range can hold one more value than the positive range.
        */
        return type(int256).min / -1;
    }

    function unCheckedAdd() external pure returns (uint256) {
        /* Here the maximum number + 1 added causes overflow; 
         and the result flips back to the smallest interger (0)*/
        unchecked {
            return type(uint256).max + 1;
        }
    }

    function unCheckedSub() external pure returns (uint256) {
        /* Here the minimum number - 1 added causes underflow; 
         and the result flips back to the largest interger*/
        unchecked {
            return type(uint256).min - 1;
        }
    }

    function unCheckedDivision() external pure returns (int256) {
        /* range[ -2*256...0...*256-1 ] 
            revert as 2**256-1 encloses 0 a spositive; so 
        */
        unchecked {
            return type(int256).min / -1;
        }
    }
}
