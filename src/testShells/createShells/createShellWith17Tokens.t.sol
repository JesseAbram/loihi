

pragma solidity ^0.5.6;

import "ds-test/test.sol";

import "../../Prototype.sol";
import "../../ERC20Token.sol";

contract DappTest is DSTest {
    Prototype pool;
    ERC20Token TEST1;
    ERC20Token TEST2;
    ERC20Token TEST3;
    ERC20Token TEST4;
    ERC20Token TEST5;
    ERC20Token TEST6;
    ERC20Token TEST7;
    ERC20Token TEST8;
    ERC20Token TEST9;
    ERC20Token TEST10;
    ERC20Token TEST11;
    ERC20Token TEST12;
    ERC20Token TEST13;
    ERC20Token TEST14;
    ERC20Token TEST15;
    ERC20Token TEST16;
    ERC20Token TEST17;
    address shell;



    function setUp () public {

        uint256 tokenAmount = 1000000000 * (10 ** 18);
        TEST1 = new ERC20Token("TEST THREE", "TEST3", 18, tokenAmount);
        TEST2 = new ERC20Token("TEST THREE", "TEST3", 18, tokenAmount);
        TEST3 = new ERC20Token("TEST THREE", "TEST3", 18, tokenAmount);
        TEST4 = new ERC20Token("TEST THREE", "TEST3", 18, tokenAmount);
        TEST5 = new ERC20Token("TEST THREE", "TEST3", 18, tokenAmount);
        TEST6 = new ERC20Token("TEST THREE", "TEST3", 18, tokenAmount);
        TEST7 = new ERC20Token("TEST THREE", "TEST3", 18, tokenAmount);
        TEST8 = new ERC20Token("TEST THREE", "TEST3", 18, tokenAmount);
        TEST9 = new ERC20Token("TEST THREE", "TEST3", 18, tokenAmount);
        TEST10 = new ERC20Token("TEST THREE", "TEST3", 18, tokenAmount);
        TEST11 = new ERC20Token("TEST THREE", "TEST3", 18, tokenAmount);
        TEST12 = new ERC20Token("TEST THREE", "TEST3", 18, tokenAmount);
        TEST13 = new ERC20Token("TEST THREE", "TEST3", 18, tokenAmount);
        TEST14 = new ERC20Token("TEST THREE", "TEST3", 18, tokenAmount);
        TEST15 = new ERC20Token("TEST THREE", "TEST3", 18, tokenAmount);
        TEST16 = new ERC20Token("TEST THREE", "TEST3", 18, tokenAmount);
        TEST17 = new ERC20Token("TEST THREE", "TEST3", 18, tokenAmount);

        pool = new Prototype();

        TEST1.approve(address(pool), tokenAmount);
        TEST2.approve(address(pool), tokenAmount);
        TEST3.approve(address(pool), tokenAmount);
        TEST4.approve(address(pool), tokenAmount);
        TEST5.approve(address(pool), tokenAmount);
        TEST6.approve(address(pool), tokenAmount);
        TEST7.approve(address(pool), tokenAmount);
        TEST8.approve(address(pool), tokenAmount);
        TEST9.approve(address(pool), tokenAmount);
        TEST10.approve(address(pool), tokenAmount);
        TEST11.approve(address(pool), tokenAmount);
        TEST12.approve(address(pool), tokenAmount);
        TEST13.approve(address(pool), tokenAmount);
        TEST14.approve(address(pool), tokenAmount);
        TEST15.approve(address(pool), tokenAmount);
        TEST16.approve(address(pool), tokenAmount);
        TEST17.approve(address(pool), tokenAmount);

    }

    function testCreateShellWith17Tokens () public {
        address[] memory shellAddrs = new address[](17);
        shellAddrs[0] = address(TEST1);
        shellAddrs[1] = address(TEST2);
        shellAddrs[2] = address(TEST3);
        shellAddrs[3] = address(TEST4);
        shellAddrs[4] = address(TEST5);
        shellAddrs[5] = address(TEST6);
        shellAddrs[6] = address(TEST7);
        shellAddrs[7] = address(TEST8);
        shellAddrs[8] = address(TEST9);
        shellAddrs[9] = address(TEST10);
        shellAddrs[10] = address(TEST11);
        shellAddrs[11] = address(TEST12);
        shellAddrs[12] = address(TEST13);
        shellAddrs[13] = address(TEST14);
        shellAddrs[14] = address(TEST15);
        shellAddrs[15] = address(TEST16);
        shellAddrs[16] = address(TEST17);
        shell = pool.createShell(shellAddrs);
    }

}