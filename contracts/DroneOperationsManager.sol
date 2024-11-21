// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Add this import at the top of your file
import "./DroneRegistry.sol";
import "./DroneFlightAuthorization.sol";
import "./DroneComplianceSystem.sol";

// Main Drone Operations Contract
contract DroneOperationsManager {
    DroneRegistry public droneRegistry;
    DroneFlightAuthorization public flightAuthorization;
    DroneComplianceSystem public complianceSystem;

    constructor(
        address _registryAddress, 
        address _flightAuthAddress, 
        address _complianceAddress
    ) {
        droneRegistry = DroneRegistry(_registryAddress);
        flightAuthorization = DroneFlightAuthorization(_flightAuthAddress);
        complianceSystem = DroneComplianceSystem(_complianceAddress);
    }

    function conductDroneOperation(
        uint256 _flightPlanId,
        uint256 _safetyScore
    ) external {
        // Validate flight plan
        (address drone, , , , , bool approved) = flightAuthorization.flightPlans(_flightPlanId);
        require(approved, "Flight plan not approved");

        // Update compliance metrics
        complianceSystem.updateSafetyScore(drone, _safetyScore);
    }
}