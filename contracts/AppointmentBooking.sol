pragma solidity ^0.5.16;

contract AppointmentBooking {
    struct Appointment {
        uint id;
        address provider;
        uint startTime;
        uint duration;
        bool isBooked;
        address booker;
    }

    Appointment[] public appointments;
    uint public nextId;

    function createAppointment(address _provider, uint _startTime, uint _duration) public {
        appointments.push(Appointment(nextId, _provider, _startTime, _duration, false, address(0)));
        nextId++;
    }

    function bookAppointment(uint id) public {
        require(id < nextId, "Appointment does not exist.");
        Appointment storage appointment = appointments[id];
        require(!appointment.isBooked, "Appointment already booked.");
        appointment.isBooked = true;
        appointment.booker = msg.sender;
    }

    function cancelBooking(uint id) public {
        require(id < nextId, "Appointment does not exist.");
        Appointment storage appointment = appointments[id];
        require(appointment.booker == msg.sender, "Only the booker can cancel the appointment.");
        appointment.isBooked = false;
        appointment.booker = address(0);
    }
}
