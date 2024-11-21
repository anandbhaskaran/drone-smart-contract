// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Flight Authorization Contract
contract DroneFlightAuthorization {
    struct FlightPlan {
        address drone;
        uint256 startTime;
        uint256 endTime;
        string startLocation;
        string endLocation;
        bool approved;
    }

    mapping(uint256 => FlightPlan) public flightPlans;
    uint256 public flightPlanCounter;

    event FlightPlanSubmitted(uint256 indexed planId, address drone);
    event FlightPlanApproved(uint256 indexed planId);
    event FlightPlanRejected(uint256 indexed planId, string reason);

    function submitFlightPlan(
        uint256 _startTime, 
        uint256 _endTime, 
        string memory _startLocation, 
        string memory _endLocation
    ) external returns (uint256) {
        require(_startTime < _endTime, "Invalid flight time");

        flightPlanCounter++;
        flightPlans[flightPlanCounter] = FlightPlan({
            drone: msg.sender,
            startTime: _startTime,
            endTime: _endTime,
            startLocation: _startLocation,
            endLocation: _endLocation,
            approved: false
        });

        emit FlightPlanSubmitted(flightPlanCounter, msg.sender);
        return flightPlanCounter;
    }

    function approveFlightPlan(uint256 _planId) external {
        FlightPlan storage plan = flightPlans[_planId];
        require(!plan.approved, "Flight plan already approved");
        
        plan.approved = true;
        emit FlightPlanApproved(_planId);
    }
}