const AppointmentBooking = artifacts.require("AppointmentBooking");

contract("AppointmentBooking", (accounts) => {
  it("should deploy the contract successfully", async () => {
    const instance = await AppointmentBooking.deployed();
    assert(instance.address !== '');
  });

  // Ovde možeš dodati više testova za funkcionalnosti ugovora
});
