onerror {quit -f}
vlib work
vlog -work work Projeto-RiscV-Arq.vo
vlog -work work Projeto-RiscV-Arq.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.top_vlg_vec_tst
vcd file -direction Projeto-RiscV-Arq.msim.vcd
vcd add -internal top_vlg_vec_tst/*
vcd add -internal top_vlg_vec_tst/i1/*
add wave /*
run -all
