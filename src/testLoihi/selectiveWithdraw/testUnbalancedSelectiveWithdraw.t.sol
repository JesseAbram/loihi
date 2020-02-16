pragma solidity ^0.5.6;

import "ds-test/test.sol";
import "ds-math/math.sol";
import "../loihiSetup.sol";

contract UnbalancedSelectiveWithdrawTest is LoihiSetup, DSMath, DSTest {

    function setUp() public {

        setupFlavors();
        setupAdapters();
        setupLoihi();
        approveFlavors(address(l));


        //I don't konw what goes into this function, but I'll give you the inputs:
        //weight_w = 0.3 weight_x = 0.3, weight_y = 0.3, weight_z = 0.1
        //deposit_w = 100, deposit_x = 100, deposit_y = 100, deposit_z = 50
        l.selectiveDeposit()

        //I don't know how to reference these variables, so interpret these assertEq as pseudocode
        assertEq(shellsMinted, 349.888393) //leaving these as floating point for now 
        assertEq(newSum / totalShells, 1.000319)
        
        //I'm not sure what this block is doing so I'll just comment it out for now...
        //address[] memory addr = new address[](1);
        //uint256[] memory amt = new uint256[](1);
        //addr[0] = dai;
        //amt[0] = 30 * WAD;
        //l.selectiveWithdraw(addr, amt, WAD * 500, now + 500);

        //addr[0] = usdt;
        //amt[0] = 30 * 1000000;
        //l.selectiveDeposit(addr, amt, 0, now + 500);

    }

    function testSelectiveDeposit () public {
        
        //Here are the inputs for the selectiveDeposit function...
        //w_deposit = 50, x_deposit = 25, y_deposit = 0, z_deposit = 15
        l.selectiveDeposit();

        //Not sure how to reference these variables so interpret this assertEq as pseudo code
        assertEq(shellsMinted, 89.659091);
        assertEq(newSum / totalShells = 1.001030);

        //not sure what this code does exactly, so for now I'll just comment it out...
        //uint256[] memory amounts = new uint256[](2);
        //address[] memory tokens = new address[](2);

        //tokens[0] = dai; amounts[0] = 10 * WAD;
        //tokens[1] = usdc; amounts[1] = 5 * 1000000;

        //uint256 shellsBurned = l.selectiveWithdraw(tokens, amounts, WAD * 500, now + 500);
        //shellsBurned /= 10000000000;
        //assertEq(shellsBurned, 1512387964);
    }

    function testProportionalWithdrawal () public {
        
        //Here are the inputs for the proportional withdrawal...
        //shellsBurned = 50
        l.proportionalDeposit();

        //interpret these assertEq() as pseudo code
        assertEq(w_withdraw, 17.054471);
        assertEq(x_withdraw, 14.212060);
        assertEq(y_withdraw, 11.369648);
        assertEq(z_withdraw, 7.390271);
        assertEq(newSum = 389.973550);
        assertEq(newSum / totalShells, 1.001094);
        
    }

    function testOriginSwap () public {
        
        //Here are the inputs for the origin swap 
        //origin_token = x
        //target_token = y 
        //origin_amount = 20
        l.swapByOrigin();

        assertEq(targetAmount, 19.678327);
        assertEq(newSum / totalShells, 1.001920);
    }

    function testTargetTrade () public {
        
        //Here is the input data...
        //origin_token = z 
        //target_token = w 
        //target_amount = 0.5
        l.swapByTarget();

        assertEq(originAmount, 0.511943);
        assertEq(newSum / totalShells, 1.001950);
    }

    function testSelectiveWithdrawal () public {

        //here is the input data
        //w_withdraw = 25
        //x_withdraw = 0
        //y_withdraw = 10
        //z_withdraw = 10
        l.selectiveWithdraw();

        assertEq(shellsBurned, 45.186012);
        assertEq(newSum / totalShells, 1.002746);
    }

    function testProportionalDeposit() public {

        //here is the input data
        //deposit_amount = 100 
        l.proportionalDeposit();

        assertEq(totalShells = 444.361471);
        assertEq(newSum / totalShells, 1.002128);
    }

}