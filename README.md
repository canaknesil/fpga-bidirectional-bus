# FPGA Bidirectional Bus

A bidirectional bus implementation in VHDL, using `inout` port.

The bus implementation in this repository is only an example to how an `inout` port in VHDL can be used. It is not intended to be used in real FPGA projects. I think this is not a good bus implementation due to the reasons given below.

The entity `bidir_bus` implements the interface to connect to a bus.  
The entity `inout_example` implements two parties who interchangeably send one bit data to each other through the bus.

The RTL description of the bus signal, `bus_data`, has multiple drivers, one from each user of the bus; however, modern FPGAs does not allow multiple drivers. During synthesis with default options (Vivado v2022.2, Artix-7 FPGA), the design is transformed such that no signal has multiple drivers, leading to a successful compilation. If proper bus arbitration is implemented as in the given implementation, meaning that no more than one user can drive the bus, the resulting design has correct functionality. However if more than one user can drive the bus, the functionality changes during synthesis and the bus no longer functions as intended. If the bus signal with multiple drivers is keps during synthesis, via synthesis options to prevent design flattenning, or via the `DONT_TOUCH` attribute, the compilation fails at the implementation stage.

Due to the mismatch between the RTL description and the underlying FPGA fabric, thus due to the complex compilation behavior, I don't recommend using the bus implementation in this repository.

