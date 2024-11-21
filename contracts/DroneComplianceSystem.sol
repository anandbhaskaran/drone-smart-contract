// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Drone Reputation and Compliance Contract
contract DroneComplianceSystem {
    struct DroneCompliance {
        uint256 totalFlights;
        uint256 safetyScore;
        bool hasViolations;
    }

    mapping(address => DroneCompliance) public droneCompliance;

    event ComplianceUpdated(address indexed drone, uint256 safetyScore);
    event ViolationRecorded(address indexed drone, string violationType);

    function updateSafetyScore(address _drone, uint256 _score) external {
        droneCompliance[_drone].safetyScore = _score;
        droneCompliance[_drone].totalFlights++;
        emit ComplianceUpdated(_drone, _score);
    }

    function recordViolation(address _drone, string memory _violationType) external {
        droneCompliance[_drone].hasViolations = true;
        emit ViolationRecorded(_drone, _violationType);
    }
}