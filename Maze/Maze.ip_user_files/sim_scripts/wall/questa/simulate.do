onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib wall_opt

do {wave.do}

view wave
view structure
view signals

do {wall.udo}

run -all

quit -force
