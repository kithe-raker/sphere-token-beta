// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract CreatorRole {
    mapping(address => bool) public creators;

    event CreatorAdded(address creator);
    event CreatorRemoved(address creator);

    constructor() {}

    function _isCreator(address sender) internal view returns (bool) {
        return creators[sender];
    }

    function _addCreator(address creator) internal {
        creators[creator] = true;
        emit CreatorAdded(creator);
    }

    function _removeCreator(address creator) internal {
        creators[creator] = false;
        emit CreatorRemoved(creator);
    }
}
