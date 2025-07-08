# ZyboZ7_10_Renderer

link renderer: https://github.com/VictorK96/SoftwareRenderer

Used:
    Vivado 2024.2
    Vitis Clasic

--- Vivado ---
1. Make Vivado Project

2. import ip from floder:
```
    "YourPath"/ZyboZ7_10_Renderer/my_resorces/zybo_z7_hdmi_repo
```

3. Add to your project:
```
    "YourPath"/ZyboZ7_10_Renderer/workspace_vivado/workspace_vivado.srcs/
    ├─   /constrs_1/imports/hardware/zybo_z7_hdmi.xdc  # file
    ├─   /sim_1/imports/new/test_AXI_matrix_mul.vhd    # file
    └─   /sources_1/                                   # folder
```

4. Create a bitstream and then export it

--- Vitis ---
1. Make Vitis Clasic Project using existing export

2. Make in folder src link to folder (you can make link folder src or all what they have):
```
    "YourPath"/ZyboZ7_10_Renderer/workspace_vitis/renderer/src
```

3. change file ```"YourPath"/workspace_vivado/workspace_vitis/renderer/src/lscript.ld``` to have Heap Size = 0x2000000

4. Last step. Build the project and run it


Melodika exigite pws ginete run swsta kai genika perisoteres plirofories
Kai to ekana me tetoio tropo wste na boreis na pirazeis to project sou kai na boreis na to anevazeis sto github
