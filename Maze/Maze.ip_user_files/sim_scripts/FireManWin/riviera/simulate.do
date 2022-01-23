onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+FireManWin -L xpm -L blk_mem_gen_v8_4_4 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.FireManWin xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {FireManWin.udo}

run -all

endsim

quit -force
