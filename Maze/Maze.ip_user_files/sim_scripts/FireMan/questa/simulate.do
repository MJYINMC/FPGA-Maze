onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib FireMan_opt

do {wave.do}

view wave
view structure
view signals

do {FireMan.udo}

run -all

quit -force
