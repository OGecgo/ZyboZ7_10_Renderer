# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/go/Desktop/ZyboZ7_10_Renderer/workspace_vitis/main_wrapper/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/go/Desktop/ZyboZ7_10_Renderer/workspace_vitis/main_wrapper/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {main_wrapper}\
-hw {/home/go/Desktop/ZyboZ7_10_Renderer/workspace_vivado/main_wrapper.xsa}\
-out {/home/go/Desktop/ZyboZ7_10_Renderer/workspace_vitis}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {empty_application}
platform generate -domains 
platform active {main_wrapper}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
