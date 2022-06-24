# Author: ArtisticZhao
# Organization: LilacSat, BY2HIT
#
# Release:
#   - Ver. 0.0.0
#     - Date: 31 Oct. 2021
#     - Note: Create the project construction.
#

# Set the name of the project:
set project_name ZCU111_RF_test

# Set the project device:
set device xczu28dr-ffvg1517-2-e

# Set the path to the directory we want to put the Vivado build in. Convention is <PROJECT NAME>_hw
set proj_dir ./work/${project_name}_hw

# Create project
create_project -name ${project_name} -force -dir ${proj_dir} -part ${device}
# Set board.
set_property board_part xilinx.com:zcu111:part0:1.2 [current_project]
# Set IP core repo.
set script_path [ file dirname [ file normalize [ info script ] ] ]
puts $script_path
set ip_qpsk_path "$script_path/QPSK_MOD/"
puts $ip_qpsk_path
set_property IP_REPO_PATHS ${ip_qpsk_path} [current_fileset]
update_ip_catalog -rebuild

# Source the BD file, BD naming convention is project_bd.tcl
source zynq_dma_qpsk_tx_10Mbps.tcl
# BD name
set bd_name design_1

make_wrapper -files [get_files ${proj_dir}/${project_name}.srcs/sources_1/bd/${bd_name}/${bd_name}.bd] -top

add_files -norecurse ${proj_dir}/${project_name}.srcs/sources_1/bd/${bd_name}/hdl/${bd_name}_wrapper.v
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

validate_bd_design
save_bd_design
close_bd_design ${bd_name}

open_bd_design ${proj_dir}/${project_name}.srcs/sources_1/bd/${bd_name}/${bd_name}.bd
set_property synth_checkpoint_mode None [get_files ${proj_dir}/${project_name}.srcs/sources_1/bd/${bd_name}/${bd_name}.bd]
