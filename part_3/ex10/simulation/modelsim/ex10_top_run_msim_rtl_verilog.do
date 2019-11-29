transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+H:/VERI/mylib {H:/VERI/mylib/tick_5000.v}
vlog -vlog01compat -work work +incdir+H:/VERI/part_3/ex10 {H:/VERI/part_3/ex10/spi2dac.v}
vlog -vlog01compat -work work +incdir+H:/VERI/part_3/ex10 {H:/VERI/part_3/ex10/ex10_top.v}

