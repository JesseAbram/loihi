pragma solidity ^0.5.12;

import "../../IAToken.sol";
import "../aaveResources/ILendingPoolAddressesProvider.sol";
import "../aaveResources/ILendingPool.sol";
import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract KovanASUsdAdapter {

    address constant susd = 0xD868790F57B39C9B2B51b12de046975f986675f9;
    address constant asusd = 0xb9c1434aB6d5811D1D0E92E8266A37Ae8328e901;
    ILendingPoolAddressesProvider constant lpProvider = ILendingPoolAddressesProvider(0x506B0B2CF20FAA8f38a4E2B524EE43e1f4458Cc5);

    event log_addr(bytes32, address);
    event log_uint(bytes32, uint256);

    constructor () public { }

    function getAToken () public returns (IAToken) {
        ILendingPool pool = ILendingPool(lpProvider.getLendingPool());
        (,,,,,,,,,,,address aTokenAddress,) = pool.getReserveData(susd);
        return IAToken(aTokenAddress);
    }

    // takes raw cdai amount
    // unwraps it into dai
    // deposits dai amount in chai
    function intakeRaw (uint256 amount) public {
        // ILendingPool pool = ILendingPool(lpProvider.getLendingPool());
        // getAToken().transferFrom(msg.sender, address(this), amount);
        IAToken(asusd).transferFrom(msg.sender, address(this), amount);
    }

    function intakeNumeraire (uint256 amount) public returns (uint256) {
        amount /= 1000000000000;
        IAToken(asusd).transferFrom(msg.sender, address(this), amount);
        return amount;
    }

    function outputRaw (address dst, uint256 amount) public {
        uint256 bal = IAToken(asusd).balanceOf(address(this));
        emit log_uint("BAL", bal);
        emit log_uint("amount", amount);
        IAToken(asusd).transfer(dst, amount);
    }

    // unwraps numeraire amount of dai from chai
    // wraps it into cdai amount
    // sends that to destination
    function outputNumeraire (address dst, uint256 amount) public returns (uint256) {
        amount /= 1000000000000;
        IAToken(asusd).transfer(dst, amount);
        return amount;
    }

    function viewRawAmount (uint256 amount) public view returns (uint256) {
        return amount / 1000000000000;
    }

    function viewNumeraireAmount (uint256 amount) public view returns (uint256) {
        return amount * 1000000000000;
    }

    function viewNumeraireBalance (address addr) public returns (uint256) {
        return IAToken(asusd).balanceOf(addr);
    }

    // takes raw amount and gives numeraire amount
    function getRawAmount (uint256 amount) public returns (uint256) {
        return amount / 1000000000000;
    }

    // takes raw amount and gives numeraire amount
    function getNumeraireAmount (uint256 amount) public returns (uint256) {
        return amount * 1000000000000;
    }

    function getNumeraireBalance () public returns (uint256) {
        return IAToken(asusd).balanceOf(address(this));
    }

    uint constant WAD = 10 ** 18;
    
    function add(uint x, uint y) internal pure returns (uint z) {
        require((z = x + y) >= x, "ds-math-add-overflow");
    }

    function sub(uint x, uint y) internal pure returns (uint z) {
        require((z = x - y) <= x);
    }

    function mul(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x, "ds-math-mul-overflow");
    }

    function wmul(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, y), WAD) / WAD;
    }

    function wdiv(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, WAD), y / 2) / y;
    }

    function wdivup(uint x, uint y) internal pure returns (uint z) {
        // always rounds up
        z = add(mul(x, WAD), sub(y, 1)) / y;
    }


}