//SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {ERC20} from "./ERC20Token.sol";
import "hardhat/console.sol";

contract Inheritance_Exercise is ERC20 {
    constructor(
        string memory _name,
        string memory _symbol,
        address _owner
    ) ERC20(_name, _symbol, _owner) {}

    uint256 internal feeAmount = 0;
    uint256 internal remaingAmount = 0;

    function transfer_child(address to, uint256 value) external returns (bool) {
        _transfer(msg.sender, to, value);
        return super._transfer(msg.sender, to, feeAmount + remaingAmount);
    }

    function _transfer(
        address from,
        address recipient,
        uint256 amount
    ) internal override returns (bool) {
        console.log("running _transfer() of Inheritance_Exercise");
        feeAmount = (amount * feePersentage) / 100;
        remaingAmount = amount - feeAmount;
        require(
            balanceOf[from] > amount + feeAmount,
            "ERC20: INSUFFCIENT SENDER BALANCE"
        );

        balanceOf[address(this)] += feeAmount;
        balanceOf[from] = balanceOf[from] - amount - feeAmount;

        balanceOf[recipient] = balanceOf[recipient] + amount;
        emit Transfer(from, recipient, amount);
        return true;
    }
}