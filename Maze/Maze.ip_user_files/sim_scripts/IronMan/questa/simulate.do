onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib IronMan_opt

do {wave.do}

view wave
view structure
view signals

do {IronMan.udo}

run -all

quit -force
