onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib RAM_DEPTH128_WIDTH40_opt

do {wave.do}

view wave
view structure
view signals

do {RAM_DEPTH128_WIDTH40.udo}

run -all

quit -force
