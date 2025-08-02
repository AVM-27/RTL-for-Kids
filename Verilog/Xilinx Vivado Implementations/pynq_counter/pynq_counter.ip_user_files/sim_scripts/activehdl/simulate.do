transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+design_1_wrapper  -L xilinx_vip -L xil_defaultlib -L axi_infrastructure_v1_1_0 -L axi_vip_v1_1_17 -L processing_system7_vip_v1_0_19 -L xlslice_v1_0_4 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.design_1_wrapper xil_defaultlib.glbl

do {design_1_wrapper.udo}

run 1000ns

endsim

quit -force
