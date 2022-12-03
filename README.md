# 4-Bit-Comparator-Storage-Elements-and-Sequential-Circuits

<h3>Description</h3>

<h4>Sequential Assignment Statements</h4>

The two main types of sequential assignment statements are: if-then-else statements and case statements. These sequential assignment statements must be placed inside a block, called a process block. The PROCESS block starts with the keyword “PROCESS”. It has an optional label and a sensitivity list. Following the PROCESS keyword is the statement “BEGIN”. Any statement between “BEGIN” and the “END PROCESS label;” are sequential statements.

The sensitivity list contains signals. Unlike concurrent statements which are executed all the time, the process block is activated only when one of the signals in its sensitivity list changes its value. Once activated, the statements inside the process block are executed sequentially in the order they appear in the block. There are two things to note: (i) Any assignments made to signals inside the process are not visible outside the process until all of the statements in the process have been evaluated; (ii) in case of multiple assignments to the same signal, only the last one determines the final value of the signal. Also note that VHDL allows multiple processes to be described within the same architecture.

<h3>4 Bit Comparator</h3>

Comparators are a useful type of arithmetic circuits that compare the relative sizes of two binary numbers. In this assignment you will implement a 4-bit comparator circuit that takes two 4-bit unsigned inputs A and B, and determines which one of the cases A = (B+1),A < (B+1),A ≤ (B+1),A > (B+1),A ≥ (B+1) holds. It should detect the occurrence of overflow when performing B + 1, i.e., detect if B + 1 requires more than 4 bits.

Note that in case of overflow when performing B + 1, the comparator circuit outputs 1 for the overflow signal while the remaining signals (i.e., AgtBplusOne, AgteBplusOne, AltBplusOne, AlteBplusOne and AlteBplusOne) are set to 0. Otherwise, the circuits outputs proper values for AgtBplusOne, AgteBplusOne, AltBplusOne, AlteBplusOne and AeqBplusOne signals according to A > (B+1),A ≥ (B+1),A < (B+1),A ≤ (B+1),A = (B+1), respectively, while the overflow signal is set to 0. For example, if A = 910 and B = 510 then both AgtBplusOne, AgteBplusOne should be 1, while the rest (including overflow) should be 0.

To describe your comparator in VHDL, use sequential statements in a single process block. Once you have described your circuit in VHDL, you should test your design on the FPGA board. Similar to the VHDL Assignment #4, the inputs of the comparator circuit are provided using the slider switches; you will need to use eight slider switches. To visualize the output signals of the comparator circuit, use the LEDs located right above the slider switches on the FPGA board. Note that you will need to use six LEDs (one for each output signal). When an output signal is set to ’1’, the corresponding LED turns on; otherwise, it will be off. Afterwards, perform the pin assignments and program the FPGA by following the instructions provided in VHDL Assignement #4. Note that the pin locations of LEDs are different from those of 7-segment LEDs. The pin assignments for the LEDs are given in Figure 3.17 on p. 25 of the Altera board manual. Once completed, test the functionality of your comparator circuit for different input values using the LEDs and slider switches.

<h3>VHDL Description of Storage Elements</h3>

In the previous VHDL assignments, you have learned how to use sequential statements to describe the behavior of combinational circuits inside the process block. Sequential statements within the process block can also be used to describe sequential circuits such as storage elements. In digital systems, we have two types of memory elements: latches and flip-flops (FFs). Latches are memory elements that immediately reflect any changes in the input signal to the output signal when the level of the control signal (clk) is high. As such, latches are usually referred to as level-triggered memory elements. Alternatively, FFs change their state when the control signal goes from either high to low or from low to high. Note that FFs working with a control signal that goes from high to low or from low to high are called, respectively, negative-edge-triggered and positive-edge-triggered FFs. In digital systems, edge-triggered flip-flops are superior to level-triggered latches since FFs are more robust. For example, noise can easily disrupt the output of a latch when the control signal is high. On the other hand, the output of FFs can be disrupted only in presence of noise at the edge transition of the control signal. It is highly recommended, therefore, to use FFs when designing sequential circuits.

In VHDL, process blocks are used to describe FFs. Since FFs set their state at the edge of the control signal, we need a statement to detect the edge transition of the control signal. This can be simply done by using a IF-THEN-ELSE statement. Assuming that clk is the control signal of a FF, a positive edge transition (i.e., a transition from ’0’ to ’1’) of the clk signal can be detected by the following statement: RISING_EDGE (clk). Similarly, a negative edge transition (i.e., a transition from ’1’ to ’0’) can be detected by the following statement FALLING_EDGE (clk).

Since the state Q (output) changes only as a result of a positive clock edge, only the clk signal is listed in the sensitivity list of the process. Note that there are additional ways to detect a clock edge, such as IF clk’EVENT AND clk = ’1’ or WAIT UNTIL clk’EVENT AND clk = ’1’ statements. The syntax clk’EVENT uses a VHDL construct called an attribute. An attribute refers to a property of an object such as a signal. In this case, the ’EVENT attribute refers to any change in the clock signal. These two statements (i.e., clk’EVENT AND clk = ’1’ and WAIT UNTIL clk’EVENT AND clk = ’1’) are described in detail in Examples 7.2 and 7.3 of the textbook. Note that if we use the WAIT UNTIL statement, then the sensitivity list of the process block should be empty.

So far, we have described a positive-triggered flip-flop in VHDL. Now, let us describe a positive-triggered flip-flop with asynchronous active-low reset (also known as clear) and asynchronous active-low set signals. When the reset signal is ’0’, the output of the FF is immediately set to ’0’, regardless of the value of the control signal (i.e., clk). Similarly, when the set signal is ’0’, the output of the FF is immediately set to ’1’, regardless of the value of the control signal (i.e., clk). The sensitivity list of the process contains, therefore, the clk, reset, and set signals, since these three signals trigger a change in the output of the FF (positive clock edge and low-activated set and reset signals.

Note that since we check the reset signal first, it has priority over the other two signals, i.e., set and clk. Similarly, set has priority over the clk signal.

<h3>Design of a Storage Element</h3>

In this assignment, you are asked to design a JKFF. The inputs to the FF are J, K, and clk. The output of the FF is Q. The operation of a JKFF is described in Section 7.6 of the textbook.

To describe your circuit in VHDL, use a single process block. Once you have your circuit described in VHDL, you should simulate it. Write a testbench code and perform a functional simulation for your VHDL description of the counter. When writing a testbench for sequential circuits, a clock signal is required within the testbench.

Note that the “clock_period” parameter should be replaced with desired clock period value. In this assignment, we will use a clock period of 10 ns. Due to the absence of any indefinite “wait” statement in the “clock_generation” process, you cannot use the run -all command in ModelSim; you must instead explicitly determine a simulation duration (e.g., run 100 ns).

Once you have described your circuit in VHDL, you should write a testbench and simulate the circuit in ModelSim. Make sure that all possible inputs to the JKFF are verified in the simulation.

<h3>Counters</h3>

A counter is a special sequential circuit. When counting up (by one), we require a circuit capable of “remembering” the current count and increase it by 1 the next time we request a count. When counting down (by one), we require a circuit capable of “remembering” the current count and subtracting 1 the next time we request a count. Counters use a clock signal to keep track of time. In fact, each increment (or decrement) occurs when one clock period has passed. To design an up-counter counting in increments of 1 second, we will first design a 3-bit up-counter counting at positive edge of the clock with an asynchronous reset (which should be active low) and an enable signal (which should be active high). The counter counts up when the enable signal is high. Otherwise, the counter holds its previous value.

Note that a 3-bit counter counts from 0 to 7. When the current count reaches 7, the next count will automatically wrap around back to 0.

Once you have your circuit described in VHDL, you should simulate it. Write a testbench code and perform a functional simulation for your VHDL description of the counter.

<h3>Clock Divider</h3>

A clock divider is a circuit that generates a signal that is asserted once every T clock cycles.

Implementing the clock divider circuit requires a counter counting clock periods. The counter counts down from T − 1 to 0. Upon reaching the count of 0, the clock divider circuit outputs/asserts 1 and the count is reset to T − 1. For other values of the counter, the output signal of the clock divider circuit remains 0. In this lab, we want to design a counter counting in increments of 1 second. In other words, we need to assert an enable signal every 1 second. First, find the value of T for the clock divider circuit to generate an enable signal every 1 second. Note that the PLL, the device which supplies the clock for your design on the DE1-SoC board, works at a frequency of 50 MHz.

<h3>3-bit Up-Counter Counting in Increments of 1 Second</h3>


In this part, you will design a simple counter circuit that counts in increments of 1 second using the counter and clock divider circuits.

Reset is an asynchronous active-low input. The normal condition of the reset is high (’1’). If reset goes low (’0’), the output of the counter should be 0 as long as reset remains low. Once reset goes back high, the counter should start counting. Enable is a synchronous active-high input. When enable is high (’1’) the counter counts every 1 second, the circuit will hold and display the current count otherwise.
