onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib FireManWin_opt

do {wave.do}

view wave
view structure
view signals

do {FireManWin.udo}

run -all

quit -force
