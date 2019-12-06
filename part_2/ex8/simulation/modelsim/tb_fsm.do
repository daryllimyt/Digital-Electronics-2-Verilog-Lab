add wave clk
add wave tick
add wave trigger
add wave time_out

add wave en_lfsr
add wave start_delay
add wave -hexadecimal ledr 

force clk 0 0, 1 10ns -repeat 20ns
force tick 0 0, 1 20ns -repeat 40ns
force trigger 1
run 80ns
force trigger 0
run 20ns
force trigger 1

run 500ns

force time_out 1

run 400ns