// SPDX-License-Identifier: MIT

pragma solidity 0.8.0;

import "./Ownable.sol";

contract KIP7Pausable is Ownable {
    bool internal _paused;

    event Paused(address _account);
    event Unpaused(address _account);

    modifier whenPaused() {
        require(_paused, "Paused : This function can only be called when paused");
        _;
    }

    modifier whenNotPaused() {
        require(!_paused, "Paused : This function can only be called when not paused");
        _;
    }

    function pause() external onlyOwner whenNotPaused returns (bool success) {
        _paused = true;
        emit Paused(msg.sender);
        success = true;
    }

    function unPause() external onlyOwner whenPaused returns (bool success) {
        _paused = false;
        emit Unpaused(msg.sender);
        success = true;
    }

    function paused() external view returns (bool) {
        return _paused;
    }
}
