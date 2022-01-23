onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+wall -L xpm -L blk_mem_gen_v8_4_4 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.wall xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {wall.udo}

run -all

endsim

quit -force
