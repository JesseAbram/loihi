pragma solidity ^0.5.12;

import "../../IAToken.sol";
import "../aaveResources/ILendingPoolAddressesProvider.sol";
import "../aaveResources/ILendingPool.sol";
import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract MainnetASUsdAdapter {

    address constant susd = 0x57Ab1ec28D129707052df4dF418D58a2D46d5f51;
    ILendingPoolAddressesProvider constant lpProvider = ILendingPoolAddressesProvider(0x24a42fD28C976A61Df5D00D0599C34c4f90748c8);

    constructor () public { }

    function getASUsd () public view returns (IAToken) {

        ILendingPool pool = ILendingPool(lpProvider.getLendingPool());
        (,,,,,,,,,,,address aTokenAddress,) = pool.getReserveData(susd);
        return IAToken(aTokenAddress);

    }

    // takes raw cdai amount
    // unwraps it into dai
    // deposits dai amount in chai
    function intakeRaw (uint256 amount) public {

        getASUsd().transferFrom(msg.sender, address(this), amount);

    }

    function intakeNumeraire (uint256 amount) public returns (uint256) {

        getASUsd().transferFrom(msg.sender, address(this), amount);
        return amount;

    }

    function outputRaw (address dst, uint256 amount) public {

        IAToken asusd = getASUsd();
        asusd.transfer(dst, amount);

    }

    // unwraps numeraire amount of dai from chai
    // wraps it into cdai amount
    // sends that to destination
    function outputNumeraire (address dst, uint256 amount) public returns (uint256) {

        getASUsd().transfer(dst, amount);
        return amount;

    }

    function viewRawAmount (uint256 amount) public view returns (uint256) {

        return amount;

    }

    function viewNumeraireAmount (uint256 amount) public view returns (uint256) {

        return amount;

    }

    function viewNumeraireBalance (address addr) public returns (uint256) {

        return getASUsd().balanceOf(addr);

    }

    // takes raw amount and gives numeraire amount
    function getRawAmount (uint256 amount) public returns (uint256) {

        return amount;

    }

    // takes raw amount and gives numeraire amount
    function getNumeraireAmount (uint256 amount) public returns (uint256) {

        return amount;

    }

    function getNumeraireBalance () public returns (uint256) {

        return getASUsd().balanceOf(address(this));

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