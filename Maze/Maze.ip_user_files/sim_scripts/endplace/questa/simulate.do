onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib endplace_opt

do {wave.do}

view wave
view structure
view signals

do {endplace.udo}

run -all

quit -force
