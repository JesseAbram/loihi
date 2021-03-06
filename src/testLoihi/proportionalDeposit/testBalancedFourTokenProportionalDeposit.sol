pragma solidity ^0.5.6;


import "ds-test/test.sol";
import "ds-math/math.sol";
import "../loihiSetup.sol";
import "../flavorsSetup.sol";
import "../../IAdapter.sol";

import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract LoihiTest is LoihiSetup, DSMath, DSTest {

    function setUp() public {

        // Agent falseAddress = new Agent(address(msg.sender));

        setupFlavors();
        setupAdapters();
        setupLoihi();
        approveFlavors(address(l));
        // executeLoihiApprovals(address(l));
        // includeAdapters(address(l), 0);

        // l.proportionalDeposit(30*WAD);
        // l.proportionalWithdraw(30*WAD);

    }

    // function testproportionalDeposit () public {
        // emit log_named_address("me", address(this));
        // emit log_named_address("msg.sender", msg.sender);

        // emit log_named_address("usdt", usdt);

        // IERC20 USDT = IERC20(usdt);

        // uint256 usdtBal = USDT.balanceOf(address(this));

        // emit log_named_uint("usdtBal", usdtBal);

        // uint256 usdtAllowance = USDT.allowance(address(this), 0xD4173Cb75590ae6e1407802F26A8B520810c8942);

        // emit log_named_uint("usdtAllowance", usdtAllowance);

        // USDT.approve(address(this), 0);

        // uint256 usdtAllowance = USDT.allowance(address(this), 0xD4173Cb75590ae6e1407802F26A8B520810c8942);

        // emit log_named_uint("usdtAllowance", usdtAllowance);



        

        // uint256 mintedShells = l.proportionalDeposit(100 * (10 ** 18));

        // uint256 cdaiBal = IERC20(cdai).balanceOf(address(l)); // 165557372275ish
        // uint256 cusdcBal = IERC20(cusdc).balanceOf(address(l)); // 163925889326ish
        // uint256 usdtBal = IERC20(ausdt).balanceOf(address(l)); // 33333333333333333300
        // uint256 asusdBal = IERC20(asusd).balanceOf(address(l));

        // uint256 usdtNumeraireAmount = IAdapter(usdtAdapter).getNumeraireAmount(usdtBal);
        // uint256 cusdcNumeraireAmount = IAdapter(cusdcAdapter).getNumeraireAmount(cusdcBal);
        // uint256 cdaiNumeraireAmount = IAdapter(cdaiAdapter).getNumeraireAmount(cdaiBal);
        
        // assertEq(mintedShells, 100 * (10 ** 18));

        // emit log_named_uint("minted shells", mintedShells);
        // emit log_named_uint("cusdcbal", cusdcBal);
        // emit log_named_uint("cdaibal", cdaiBal);
        // emit log_named_uint("usdtBal", usdtBal);

        // emit log_named_uint("cusdcNumeraireAmount", cusdcNumeraireAmount);
        // emit log_named_uint("cdaiNumeraireAmount", cdaiNumeraireAmount);
        // emit log_named_uint("usdtNumeraireAmount", usdtNumeraireAmount);

        // assertEq(usdtNumeraireAmount / (10 ** 10), 3333333300);
        // assertEq(cusdcNumeraireAmount / (10 ** 10), 3333333300);
        // assertEq(cdaiNumeraireAmount / (10 ** 10), 3333333333);

    // }


    // function testProportionalDepositIntoSubOnePool () public {

    //     uint256 mintedShells = l.proportionalDeposit(100 * (10 ** 18));
    //     assertEq(mintedShells, 100 * (10 ** 18));
    //     // (uint256 totalBalance, uint256[] memory balances) = l.totalReserves();
    //     // emit log_named_uint("totalBal", totalBalance);
    //     // emit log_uints("balances", balances);

    //     uint256[] memory burnedShells = l.proportionalWithdraw(mintedShells-1);

    //     // (totalBalance, balances) = l.totalReserves();
    //     // emit log_named_uint("totalBal", totalBalance);
    //     // emit log_uints("balances", balances);
    //     // emit log_uints("burnedShells", burnedShells);

    //     mintedShells = l.proportionalDeposit(10*WAD);
    //     emit log_named_uint("mintedShells", mintedShells);
    //     // (totalBalance, balances) = l.totalReserves();
    //     // emit log_named_uint("totalBal", totalBalance);
    //     // emit log_uints("balances", balances);
    //     // emit log_uints("burnedShells", burnedShells);

    //     burnedShells  = l.proportionalWithdraw(mintedShells/2);

    //     // (totalBalance, balances) = l.totalReserves();
    //     // emit log_named_uint("totalBal", totalBalance);
    //     // emit log_uints("balances", balances);
    //     // emit log_uints("burnedShells", burnedShells);

    // }

}