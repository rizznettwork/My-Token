// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transferFrom(address, address, uint) external returns (bool);
    function approve(address spender, uint value) external returns (bool);
}

interface IWETH {
    function deposit() external payable;
}

interface IFactory {
    function createPair(address, address) external returns (address);
}

contract Router {
    address public factory;
    address public weth;

    constructor(address _factory, address _weth) {
        factory = _factory;
        weth = _weth;
    }

    function addLiquidityETH(
        address token,
        uint amountToken
    ) external payable {
        IERC20(token).transferFrom(msg.sender, address(this), amountToken);
        IWETH(weth).deposit{value: msg.value}();
        IFactory(factory).createPair(token, weth);
    }
}
