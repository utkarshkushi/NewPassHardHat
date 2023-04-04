/** @type import('hardhat/config').HardhatUserConfig */
require('@nomiclabs/hardhat-waffle');
module.exports = {
  solidity: "0.8.18",
  defaultNetwork: 'hardhat',
  networks : {
    hardhat: {
      forking: {
        enabled: true,
        url: 'https://eth-mainnet.g.alchemy.com/v2/KpCwjWRZYFpj2un40kCnQinRz8V8R2ZS'
      },
      chainId: 31337
    }
  },
  paths: {
    tests: "./tests/"
  }
  
};
