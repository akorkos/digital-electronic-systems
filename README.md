# Digital, Electronic Systems

The material was developed during the course [Digital, Electronic Systems
[NNA-07-08]](https://elearning.auth.gr/course/view.php?id=8109) (2023/24) of the
Department of Computer Science at Aristotle University of Thessaloniki.<br/> 

## Introduction

Digital design of logic circuits is a fundamental part of computer engineering.
The design of logic circuits is done using Hardware Description Languages (HDLs).
The most common HDLs are Verilog and VHDL. This project focuses on the design of
logic circuits using VHDL. The project is divided into two parts. The first part
focuses on the design of combinational (comb) circuits, while the second part 
focuses on the design of sequential (seq) circuits. All the circuits designed
and implemented are fundamental circuits, that are used in the design of more 
complex circuits.

Besides the design of the circuits, the project also focuses on the simulation 
and validation of the circuits. All the above are done using free and open
source software. The software used for the design and simulation of the circuits
are GHDL and GTKWave. The VHDL codes for the circuits are following the version 
2008 of IEEE standard 1076.  

## Contents

### Sequential (seq) circuits:
* D flip-flop
* JK flip-flop
* RAM
* Sequential multiplier

### Combinatorial (comb) circuits:
* LED counter
* Multiplexer
* Full adder
* Comparator
* Encoder


## Requirements

* Make
* GHDL
* GTKWave

## Compile & Run

1. Analyze the source file(s): 

```
ghdl -a –std=08 –ieee=synopsys <design>.vhd
```

3. Analyze the testbench file(s):

```
ghdl -a –std=08 –ieee=synopsys tb_<design>.vhd
```

5. Generate executable file:

```
ghdl -e –std=08 –ieee=synopsys tb_<design>
```

6. Run the simulation:

```
ghdl -r –std=08 –ieee=synopsys tb_<design>.vhd –vcd=tb_<design>.vcd
```

7. View the waveform:

```
gtkwave tb_<design>.vcd
```
