onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib fire_opt

do {wave.do}

view wave
view structure
view signals

do {fire.udo}

run -all

quit -force
