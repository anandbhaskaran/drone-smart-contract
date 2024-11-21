require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

// Validate required environment variables
const requiredEnvVars = ["INFURA_PROJECT_ID", "PRIVATE_KEY"];
for (const envVar of requiredEnvVars) {
  if (!process.env[envVar]) {
    throw new Error(`Missing required environment variable: ${envVar}`);
  }
}

module.exports = {
  solidity: {
    version: "0.8.20",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  networks: {
    mainnet: {
      url: `https://mainnet.infura.io/v3/${process.env.INFURA_PROJECT_ID}`,
      accounts: [process.env.PRIVATE_KEY],
      gasPrice: "auto"
    },
    polygon: {
      url: `https://polygon-rpc.com`,
      accounts: [process.env.PRIVATE_KEY],
      gasPrice: "auto"
    }
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY
  }
};
