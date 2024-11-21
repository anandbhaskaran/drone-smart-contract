const { ethers } = require("hardhat");

async function main() {
  console.log("Starting deployment...");

  // Deploy DroneRegistry first
  const DroneRegistry = await ethers.getContractFactory("DroneRegistry");
  const droneRegistry = await DroneRegistry.deploy();
  await droneRegistry.deployed();
  console.log("DroneRegistry deployed to:", droneRegistry.address);

  // Deploy DroneFlightAuthorization with DroneRegistry address
  const DroneFlightAuth = await ethers.getContractFactory("DroneFlightAuthorization");
  const droneFlightAuth = await DroneFlightAuth.deploy(droneRegistry.address);
  await droneFlightAuth.deployed();
  console.log("DroneFlightAuthorization deployed to:", droneFlightAuth.address);

  // Continue with other contracts...
  
  // Verify contracts if not on localhost
  if (network.name !== "hardhat" && network.name !== "localhost") {
    console.log("Waiting for block confirmations...");
    await droneRegistry.deployTransaction.wait(6); // Wait for 6 confirmations
    
    console.log("Verifying contracts...");
    await hre.run("verify:verify", {
      address: droneRegistry.address,
      constructorArguments: [],
    });
  }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });