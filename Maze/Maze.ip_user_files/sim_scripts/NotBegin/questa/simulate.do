onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib NotBegin_opt

do {wave.do}

view wave
view structure
view signals

do {NotBegin.udo}

run -all

quit -force
