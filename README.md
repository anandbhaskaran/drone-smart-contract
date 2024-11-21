# Drone Management System Smart Contracts

A decentralized drone management system built on Ethereum that handles drone registration, flight authorization, and compliance monitoring through smart contracts.

## Why this solution is better than traditional solutions?

- **Decentralization**: The system is built on Ethereum, a decentralized blockchain, which provides a more secure and transparent platform for drone management.
- **Transparency**: All operations are recorded on the blockchain, providing a transparent and immutable record of all drone activities.
- **Scalability**: The system can scale to handle a large number of drones and operations, making it suitable for large-scale drone management applications.

## Overview

This project implements a comprehensive drone management system using four main smart contracts:

1. **DroneRegistry**: Handles drone registration and status management
2. **DroneFlightAuthorization**: Manages flight plans and authorizations
3. **DroneComplianceSystem**: Tracks drone safety scores and compliance records
4. **DroneOperationsManager**: Coordinates operations between other contracts

## Features

- **Drone Registration**
  - Register new drones with serial numbers and models
  - Track drone ownership on the blockchain
  - Manage drone operational status

- **Flight Management**
  - Submit and approve flight plans
  - Track flight times and locations
  - Validate flight authorizations

- **Compliance Monitoring**
  - Record safety scores for each drone
  - Track violation history
  - Monitor total flights per drone

## Smart Contract Architecture

### DroneRegistry.sol

- Manages drone registration and ownership
- Tracks drone status (Active, Suspended, Decommissioned)
- Prevents duplicate serial number registration

### DroneFlightAuthorization.sol

- Handles flight plan submissions
- Manages approval process for flight plans
- Stores flight details including time and location

### DroneComplianceSystem.sol

- Records safety scores and violations
- Tracks total flights per drone
- Maintains compliance history

### DroneOperationsManager.sol

- Coordinates between other contracts
- Validates operations
- Manages cross-contract interactions

## Environment Setup

Before running the project, you'll need to set up your environment variables. Copy `.env.example` to a new file called `.env`:

```bash
cp .env.example .env
```

Then obtain and fill in the following values:

### 1. Infura Project ID

- Go to [Infura.io](https://infura.io/)
- Sign up or log in
- Create a new project
- Find your Project ID in the project settings

### 2. Private Key

- From MetaMask:
  1. Open MetaMask
  2. Click the three dots menu
  3. Go to "Account Details"
  4. Click "Export Private Key"
  5. Enter your password
  6. Copy the private key (without 0x prefix)

⚠️ **IMPORTANT**: Never share your private key with anyone and ensure your `.env` file is in `.gitignore`

### 3. Etherscan API Key

- Go to [Etherscan.io](https://etherscan.io/)
- Sign up or log in
- Go to your profile and click "API Keys"
- Create a new API key

Your final `.env` file should look like this:

```env
INFURA_PROJECT_ID=your_infura_project_id
PRIVATE_KEY=your_wallet_private_key
ETHERSCAN_API_KEY=your_etherscan_api_key
REPORT_GAS=true
```

## Deployment

The deployment script (`scripts/deploy.js`) handles the deployment of all contracts in the correct order and verifies them on Etherscan (for supported networks).

To deploy:

```bash
npx hardhat run scripts/deploy.js --network <network-name>
```

## Security Considerations

- All contracts use Solidity 0.8.20
- Access control implemented for critical functions
- Status tracking for drone operations
- Validation checks for flight plans
- Compliance monitoring system

## Development

### Prerequisites

- Node.js v14+ and npm
- Hardhat
- An Ethereum wallet (e.g., MetaMask)

### Installation

1. Clone the repository
2. Install dependencies:

```bash
npm install
```

3. Set up your `.env` file as described above
4. Compile contracts:

```bash
npx hardhat compile
```

## Testing

Run the test suite:

```bash
npx hardhat test
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.
