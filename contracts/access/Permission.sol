// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../../contracts/access/CreatorRole.sol";

contract Permission is CreatorRole {
    address private _owner;
    bool private _allowEveryone;

    constructor() CreatorRole() {
        _owner = msg.sender;
        _allowEveryone = false;
    }

    function owner() public view returns (address) {
        return _owner;
    }

    function allowEveryone() public view returns (bool) {
        return _allowEveryone;
    }

    function setPermission(bool isAllowEveryone) public virtual onlyOwner {
        _allowEveryone = isAllowEveryone;
    }

    function addCreator(address creator) public virtual onlyOwner {
        _addCreator(creator);
    }

    function removeCreator(address creator) public virtual onlyOwner {
        _removeCreator(creator);
    }

    modifier onlyCreator() {
        require(
            _isOwner() || _isCreator(msg.sender) || _allowEveryone,
            "You don't have permission to access"
        );
        _;
    }

    modifier onlyOwner() {
        require(_isOwner(), "You don't have permission to access");
        _;
    }

    function _isOwner() private view returns (bool) {
        return _owner == msg.sender;
    }
}
