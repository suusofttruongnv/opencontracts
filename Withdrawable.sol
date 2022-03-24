// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Context.sol";

abstract contract Withdrawable is Ownable {

    /**
     * @dev Withdraw token function
     */
    function withdrawToken(address _token, uint256 _amount) external onlyOwner {
        IERC20 tokenContract = IERC20(_token);
        
        // transfer the token from address of this contract
        // to address of the user (executing the withdrawToken() function)
        tokenContract.transfer(_msgSender(), _amount);
    }

    /**
     * @dev the owner withdraw all the ether contained in the contract. 
     */
    function withdraw() public onlyOwner {
        payable(_msgSender()).transfer(address(this).balance);
    }
}