onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib cloud_opt

do {wave.do}

view wave
view structure
view signals

do {cloud.udo}

run -all

quit -force
