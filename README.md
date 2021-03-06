# Lo'ihi
Lo'ihi is a stablecoin automated market maker designed to have no slippage beyond the liquidity fee and to pass arbitrage profits on to the liquidity providers.

It can take any groupings of stablecoins into the pool and can facilitate trading between any flavor of stablecoin derivatives.

It is named Lo'ihi after the submarine volcano of the same name destined to be the sixth Hawaiian island.


## Methods

### swapByOrigin(address origin, address target, uint256 originAmount, uint256 minimumTargetAmount, uint256 deadline) returns (uint256 targetAmount)

Swap a given amount of the origin stablecoin for the target stablecoin.
Limit the transaction by setting the minimum target amount and deadline for execution.
Returns the target amount

### transferByOrigin(address origin, address target, uint256 originAmount, uint256 minimumTargetAmount. uint256 deadline, address recipient) returns (uint256 targetAmount)

Same as swapByOrigin except it sends target amount to specified recipient

### viewOriginTrade(address origin, address target, uint256 originAmount) view returns (uint256 targetAmount)

Returns the target amount for the given origin amount

### swapByTarget(address origin, address target, uint256 maximumOriginAmount, uint256 targetAmount, uint256 deadline) returns (uint256 originAmount)

Swap a given amount of the target stablecoin for the origin stablecoin
Limit the transaction by setting the maximum origin amount and deadline for execution
Returns the origin amount

### transferByOrigin(address origin, address target, uint256 maximumOriginAmount, uint256 targetAmount, uint256 deadline, address recipient) returns (uint256 originAmount)

Same as swapByTarget except it sends target amount to specified recipient


### proportionalDeposit(uint256 totalStablecoins) returns (uint256 shellsMinted)

Specify a total amount of stablecoins that will be divided according to the 
weight of the given numeraire (dai, usdc, usdt, susd) and deposited into the 
pool in return for the corresponding amount of shell tokens.

For instance a deposit of 100 will deposit 30 Dai, 30 Usdc, 30 Usdt and 10 Susd 
for a pool 30% Dai, 30% Usdc, 30% Usdt and 10% Susd as the numeraire assets.

Returns the amount of shell tokens minted by the deposit.

### selectiveDeposit(address[] flavors, uint256[] amounts, uint256 minimumShellTokens, uint256 deadline) returns (uint256 mintedShellTokens)

Allows the deposit of an arbitrary number and type of stablecoins in return
for shell tokens.

The first argument is an array of stablecoin flavors to deposit. The second 
argument is an array of uint256s whose indexes correspond to the indexes of 
the first argument of an array of addresses.

The function computes the amount of shell tokens the deposit mint, including
any fees, and returns the amount of shell tokens minted to the users address.

Is limited by minimum shell tokens and block number deadline.

### proportionalWithdraw(uint256 totalShellTokensToBurn) returns (uint256[] withdrawnStablecoins)

This function accepts a total amount of shell tokens to redeem for the underlying
stableocins. It burns the shell tokens according to the current proportions
of the reserves.

The shell tokens to burn are denominated in raw shell tokens, not the numeraire
value of the shell tokens. 

### selectiveWithdraw(address[] flavors, uint256[] amounts, uint256 maxShellsToBurn, uint256 deadline) returns (uint256 burntShellTokens)

Allows the withdrawal of arbitrary amounts of arbitrary stablecoins in the shell

The first argument is an array of addresses. The second argument is an array of 
uint256s whose indexes map to the addresses of the first argument of an array of
stablecoin addresses.

The amount of shell tokens burnt is computed using these inputs and is returned
to the user after the corresponding tokens are transferred.

Can be limited by maxShellsToBurn and the deadline of the block number.

Returns the amount of shell tokens burned.

MAINNET: 

CHAI: 0x06AF07097C9Eeb7fD685c692751D5C66dB49c215
CDAI: 0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643
DAI: 0x6B175474E89094C44Da98b954EedeAC495271d0F

CUSDC: 0x39AA39c021dfbaE8faC545936693aC917d5E7563
USDC: 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48

ASUSD: 0x625aE63000f46200499120B906716420bd059240
SUSD: 0x57Ab1ec28D129707052df4dF418D58a2D46d5f51

AUSDT: 0x71fc860F7D3A592A4a98740e39dB31d25db65ae8
USDT: 0xdAC17F958D2ee523a2206206994597C13D831ec7

DAI Adapter: 0x890C0CeAB38e1dC33fF73EE4AD19C2c4de51fE46
CHAI Adapter: 0x0CBF8297339CED404c4863967B5C80BdA631f65E
CDAI Adapter: 0x22c31b774018D497B110632656eF18731e602823

CUSDC Adapter: 0xa2762cfb37472C3B7c00017076298467Fdc7b805
USDC Adapter: 0x6a90e1f881a1aC7A078a1577DdEe1230Fe744720

ASUSD Adapter: 0xF56eD139F1c5c987e82C12F0da527723D7Ecc31C
SUSD Adapter: 0xcBF43887aCd705d5A519025BA7db6c40C42abbe2

AUSDT Adapter: 0xD2FE45B37e58DB3452B99E232c47e4a6c52b98af
USDT Adapter: 0xE40cCc76C26CaA27aCC92F9C8cf28192DB7ECd82
