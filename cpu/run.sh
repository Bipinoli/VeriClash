#!/bin/bash

echo "\n:l to load module. :r to reload. :verilog to generate HDL\n \n:l CpuTest.hs and run 'main' to run CpuTest \n:l ExecuteTest.hs and run 'main' to run ExecuteTest \n:l Cpu.hs and run ':verilog' to generate a verilog for the cpu \n"
stack exec -- clashi
