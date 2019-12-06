add wave clk
add wave start_counting
add wave end_counting
add wave -hexadecimal count

force clk 0 0, 1 10ns -repeat 20ns
force start_counting 0
force end_counting 0


run 40ns

force start_counting 1

run 20ns

force start_counting 0

run 80ns

force end_counting 1

run 40ns
