# IEEE_task
## UART Protocol Overview
The UART protocol involves the transmission and reception of serial data, usually in 8-bit frames, at a specified baud rate. It utilizes start and stop bits to frame each data byte and ensure synchronization between the communicating devices. The UART design presented in this repository adheres to the standard UART protocol specifications.

## Interface
The two signals of each UART device are named:

- Transmitter (Tx)
- Receiver (Rx)
The main purpose of a transmitter and receiver line
for each device is to transmit and receive serial data
intended for serial communication.


The transmitting UART is connected to a controlling data bus that sends data in a parallel form. From this, the data will now be transmitted on the transmission line (wire) serially, bit by bit, to the receiving UART. This, in turn, will convert the serial data into parallel for the receiving device.
The UART lines serve as the communication medium to transmit and receive one data to another. Take note that a UART device has a transmit and receive pin dedicated for either transmitting or receiving
![Interface](https://i.ibb.co/mJq2kGp/Screenshot-2023-09-17-204651.png)
