onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib thanos_opt

do {wave.do}

view wave
view structure
view signals

do {thanos.udo}

run -all

quit -force
