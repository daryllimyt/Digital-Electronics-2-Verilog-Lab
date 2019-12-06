add wave clk
add wave -hexadecimal data_out

force clk 0 0, 1 10ns -repeat 20ns

run 1000ns