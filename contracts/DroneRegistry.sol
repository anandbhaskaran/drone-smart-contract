// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Drone Registry Contract
contract DroneRegistry {
    struct Drone {
        address owner;
        string serialNumber;
        string model;
        bool isRegistered;
        uint256 registrationTimestamp;
        DroneStatus status;
    }

    enum DroneStatus {
        Unregistered,
        Active,
        Suspended,
        Decommissioned
    }

    mapping(address => Drone) public drones;
    mapping(string => bool) public serialNumberExists;

    event DroneRegistered(address indexed owner, string serialNumber);
    event DroneStatusUpdated(address indexed drone, DroneStatus newStatus);

    function registerDrone(string memory _serialNumber, string memory _model) external {
        require(!serialNumberExists[_serialNumber], "Drone serial number already registered");
        
        drones[msg.sender] = Drone({
            owner: msg.sender,
            serialNumber: _serialNumber,
            model: _model,
            isRegistered: true,
            registrationTimestamp: block.timestamp,
            status: DroneStatus.Active
        });

        serialNumberExists[_serialNumber] = true;
        emit DroneRegistered(msg.sender, _serialNumber);
    }

    function updateDroneStatus(address _drone, DroneStatus _newStatus) external {
        require(drones[_drone].isRegistered, "Drone not registered");
        drones[_drone].status = _newStatus;
        emit DroneStatusUpdated(_drone, _newStatus);
    }
}