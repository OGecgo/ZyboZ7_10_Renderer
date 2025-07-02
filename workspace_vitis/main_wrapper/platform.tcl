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
domain create -name {linux_ps7_cortexa9} -display-name {linux_ps7_cortexa9} -os {linux} -proc {ps7_cortexa9} -runtime {cpp} -arch {32-bit} -support-app {linux_hello_world}
platform active {main_wrapper}
domain active {zynq_fsbl}
domain active {linux_ps7_cortexa9}
platform generate -quick
