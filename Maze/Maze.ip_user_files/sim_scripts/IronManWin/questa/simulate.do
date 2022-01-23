onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib IronManWin_opt

do {wave.do}

view wave
view structure
view signals

do {IronManWin.udo}

run -all

quit -force
