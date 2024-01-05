//SPDX-License-Identifier: MIT

pragma solidity 0.8.21;
 contract Enum {
    enum  Stages{
        Init, //0
        Start,//1
        Middle,//2
        End //3
    }
    //default enum is 0
    Stages public stage;

   /* Progressin through differnt staegs of the smart contarct 
    using ENUMS */
    function init() external {
        require(stage==Stages.Init);
        //Do stuff here then progress to the next stage
        stage = Stages.Start;
    }

    function start() external {
        require(stage==Stages.Start);
         //Do stuff here then progress to the next stage
        stage = Stages.Middle;
    }

    function continuing() external {
        require(stage==Stages.Middle);
         //Do stuff here then progress to the next stage
        stage = Stages.End;
    }
    function end() external view {
        require(stage==Stages.End);
         //Do stuff here then progress to the next stage
       
    }
 }