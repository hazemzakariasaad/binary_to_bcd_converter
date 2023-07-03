# binary_to_bcd_converter
This project implements a module called BCDConvert in SystemVerilog that performs the conversion of binary numbers to Binary Coded Decimal (BCD) format. BCD is a way of representing decimal numbers using a binary encoding scheme.

The BCDConvert module takes in a binary input (bin_d_in) and generates a BCD output (bcd_d_out). The conversion process is divided into several states: IDLE, SETUP, ADD, SHIFT, and DONE. The module operates on a clock signal (clk) and is enabled by an enable signal (en).

# The conversion algorithm employed by the BCDConvert module is as follows:
1-On the positive edge of the clock, if the enable signal is active and the module is not busy, the binary input is loaded into the module.
2-The module then enters the SETUP state, setting the busy flag and transitioning to the ADD state.
3-In the ADD state, each nibble of the BCD data is checked. If a nibble is greater than 4, it is incremented by 3.
4-After all nibbles are checked and possibly modified, the module enters the SHIFT state. Here, the BCD data is shifted left by one position.
5-The shifting process is repeated until all bits have been shifted 11 times, at which point the module transitions to the DONE state.
6-In the DONE state, the result is marked as ready, and the module transitions back to the IDLE state.
The BCDConvertTB module serves as a testbench to verify the functionality of the BCDConvert module. It sets up the necessary input signals (clk, en, bin_d_in) and connects them to the corresponding signals of the BCDConvert module. The testbench generates a clock signal, and on the positive edge of the clock, it checks the readiness signal (rdy). If the output BCD matches the expected value (16'b00100100), the test case is considered successful; otherwise, it is marked as a failure.

# This project aims to provide an efficient and accurate conversion of binary numbers to BCD format, ensuring reliable decimal representation in digital systems.
