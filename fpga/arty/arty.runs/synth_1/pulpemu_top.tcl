# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a35tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/hgiang/Pulpino-for-dummies/fpga/arty/arty.cache/wt [current_project]
set_property parent.project_path /home/hgiang/Pulpino-for-dummies/fpga/arty/arty.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo /home/hgiang/Pulpino-for-dummies/fpga/arty/arty.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
set_property include_dirs {
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/includes
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/include
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_event_unit/include
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_node
} [current_fileset]
set_property verilog_define PULP_FPGA_EMUL=1 [current_fileset]
read_verilog -library xil_defaultlib -sv {
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/include/riscv_defines.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/include/riscv_tracer_defines.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/include/apu_core_package.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/components/cluster_clock_gating.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_L0_buffer.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_alu.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_alu_div.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_apu_disp.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_compressed_decoder.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_controller.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_cs_registers.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_debug_unit.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_decoder.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_ex_stage.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_fetch_fifo.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_hwloop_controller.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_hwloop_regs.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_id_stage.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_if_stage.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_int_controller.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_load_store_unit.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_mult.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_prefetch_L0_buffer.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_prefetch_buffer.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_register_file_latch.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/riscv/riscv_core.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/adv_dbg_if/rtl/adbg_axi_biu.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/adv_dbg_if/rtl/adbg_axi_module.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/adv_dbg_if/rtl/adbg_or1k_biu.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/adv_dbg_if/rtl/adbg_or1k_module.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/adv_dbg_if/rtl/adbg_or1k_status_reg.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/adv_dbg_if/rtl/adbg_top.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/adv_dbg_if/rtl/adv_dbg_if.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb2per/apb2per.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_event_unit/apb_event_unit.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_fll_if/apb_fll_if.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_gpio/apb_gpio.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_i2c/i2c_master_defines.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_i2c/apb_i2c.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_node/apb_node.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_node/apb_node_wrap.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_pulpino/apb_pulpino.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_spi_master/apb_spi_master.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_timer/apb_timer.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi2apb/axi2apb.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi2apb/axi2apb32.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/axi2apb_wrap.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_node/axi_AR_allocator.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_node/axi_AW_allocator.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_node/axi_ArbitrationTree.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_node/axi_BR_allocator.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_node/axi_BW_allocator.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_node/axi_DW_allocator.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_node/axi_FanInPrimitive_Req.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_node/axi_RR_Flag_Req.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_node/axi_address_decoder_AR.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_node/axi_address_decoder_AW.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_node/axi_address_decoder_BR.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_node/axi_address_decoder_BW.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_node/axi_address_decoder_DW.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_slice/axi_ar_buffer.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_slice/axi_aw_buffer.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_slice/axi_b_buffer.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_mem_if_DP/axi_mem_if_SP.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/axi_mem_if_SP_wrap.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_node/axi_multiplexer.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_node/axi_node.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/axi_node_intf_wrap.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_slice/axi_r_buffer.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_mem_if_DP/axi_read_only_ctrl.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_node/axi_request_block.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_node/axi_response_block.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_slice/axi_slice.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/axi_slice_wrap.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_spi_slave/axi_spi_slave.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/axi_spi_slave_wrap.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_slice/axi_w_buffer.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_mem_if_DP/axi_write_only_ctrl.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/boot_code.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/boot_rom_wrap.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/components/cluster_clock_inverter.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/components/cluster_clock_mux2.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/core2axi/core2axi.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/core2axi_wrap.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/core_region.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/components/generic_fifo.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_event_unit/generic_service_unit.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_i2c/i2c_master_bit_ctrl.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_i2c/i2c_master_byte_ctrl.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/instr_ram_wrap.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/periph_bus_wrap.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/peripherals.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/pulpino_top.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/ram_mux.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/components/rstgen.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_event_unit/sleep_unit.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/sp_ram_wrap.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_spi_master/spi_master_apb_if.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_spi_master/spi_master_clkgen.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_spi_master/spi_master_controller.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_spi_master/spi_master_fifo.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_spi_master/spi_master_rx.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_spi_master/spi_master_tx.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_spi_slave/spi_slave_axi_plug.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_spi_slave/spi_slave_cmd_parser.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_spi_slave/spi_slave_controller.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_spi_slave/spi_slave_dc_fifo.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_spi_slave/spi_slave_regs.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_spi_slave/spi_slave_rx.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_spi_slave/spi_slave_syncro.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_spi_slave/spi_slave_tx.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_timer/timer.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/clk_rst_gen.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/components/pulp_clock_inverter.sv
  /home/hgiang/Pulpino-for-dummies/pulpino/rtl/components/pulp_clock_mux2.sv
}
read_verilog -library xil_defaultlib {
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/adv_dbg_if/rtl/adbg_tap_defines.v
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/adv_dbg_if/rtl/adbg_tap_top.v
  /home/hgiang/Pulpino-for-dummies/pulpino/fpga/rtl/pulpino_wrap.v
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/adv_dbg_if/rtl/adbg_axi_defines.v
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/adv_dbg_if/rtl/adbg_defines.v
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/adv_dbg_if/rtl/adbg_or1k_defines.v
  /home/hgiang/Pulpino-for-dummies/fpga/arty/top/rtl/pulpemu_top.v
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/adv_dbg_if/rtl/adbg_lint_defines.v
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_slice_dc/dc_token_ring_fifo_dout.v
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_slice_dc/dc_token_ring_fifo_din.v
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_slice_dc/dc_full_detector.v
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_slice_dc/dc_token_ring.v
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_slice_dc/dc_data_buffer.v
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/axi/axi_slice_dc/dc_synchronizer.v
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/adv_dbg_if/rtl/adbg_crc32.v
}
read_vhdl -library xil_defaultlib {
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_uart/apb_uart.vhd
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_uart/slib_clock_div.vhd
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_uart/slib_counter.vhd
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_uart/slib_edge_detect.vhd
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_uart/slib_fifo.vhd
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_uart/slib_input_filter.vhd
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_uart/slib_input_sync.vhd
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_uart/slib_mv_filter.vhd
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_uart/uart_baudgen.vhd
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_uart/uart_interrupt.vhd
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_uart/uart_receiver.vhd
  /home/hgiang/Pulpino-for-dummies/pulpino/ips/apb/apb_uart/uart_transmitter.vhd
}
read_ip -quiet /home/hgiang/Pulpino-for-dummies/fpga/arty/arty.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
set_property used_in_implementation false [get_files -all /home/hgiang/Pulpino-for-dummies/fpga/arty/arty.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/hgiang/Pulpino-for-dummies/fpga/arty/arty.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
set_property used_in_implementation false [get_files -all /home/hgiang/Pulpino-for-dummies/fpga/arty/arty.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]

read_ip -quiet /home/hgiang/Pulpino-for-dummies/fpga/arty/arty.srcs/sources_1/ip/xilinx_mem_8192x32/xilinx_mem_8192x32.xci
set_property used_in_implementation false [get_files -all /home/hgiang/Pulpino-for-dummies/fpga/arty/arty.srcs/sources_1/ip/xilinx_mem_8192x32/xilinx_mem_8192x32_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/hgiang/Pulpino-for-dummies/fpga/arty/top/xdc/arty_pulpino.xdc
set_property used_in_implementation false [get_files /home/hgiang/Pulpino-for-dummies/fpga/arty/top/xdc/arty_pulpino.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top pulpemu_top -part xc7a35tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef pulpemu_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file pulpemu_top_utilization_synth.rpt -pb pulpemu_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
