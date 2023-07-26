// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

/**
 * @title A sample Raffle Contract
 * @author Kelvineth
 * @notice this contract is for creating a sample raffle
 */

contract Raffle {
    error Raffle__NotEnoughEthSent();

    uint256 private immutable i_entranceFee;
    address payable[] private s_participants;

    constructor(uint256 entranceFee_) {
        i_entranceFee = entranceFee_;
    }

    function enterRaffle() external payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughEthSent();
        }
        s_participants.push(payable(msg.sender));
    }

    function pickWinner() public {}

    // Getters functions

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
