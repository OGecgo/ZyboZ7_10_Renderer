ZyboZ7_10_Renderer/
├─ HW/
│  ├─ 3rd-party/
│  │  └─ HDMI/
│  │     ├─ if/
│  │     │  └─ tmds_v1_0/ (tmds.xml, tmds_rtl.xml)
│  │     └─ ip/
│  │        ├─ axi_dynclk/ (bd/, component.xml, drivers/, src/, xgui/)
│  │        └─ rgb2dvi/   (docs/, src/, xgui/)
│  ├─ constr/
│  │  └─ Zybo-Z7-Master.xdc
│  ├─ src/
│  │  ├─ Rasterizer.v
│  │  ├─ RowPacker.v
│  │  └─ VTU.v
│  ├─ workspace_vivado/
│  │  └─ workspace_vivado.srcs/
│  │     ├─ constrs_1/imports/hardware/ (zybo_z7_hdmi.xdc)
│  │     ├─ sim_1/imports/new/           (test_*.vhd)
│  │     └─ sources_1/bd/main/           (ipshared/, ip/, ui/, *.bd *.bda)
│  ├─ imports/
│  │  └─ new/ (axi_stream_mul_*.vhd, matrix_reg.vhd, mul_*.vhd)
│  ├─ MainBlock.tcl
│  ├─ MainBlock_wrapper.xsa
│  └─ hdmi.tcl
├─ SW/
│  ├─ src/
│  │  ├─ MeshImporter/
│  │  │  └─ src/
│  │  │     ├─ MeshOptimizer/
│  │  │     │  ├─ indexgenerator.cpp
│  │  │     │  ├─ vcacheoptimizer.cpp
│  │  │     │  ├─ vfetchoptimizer.cpp
│  │  │     │  └─ meshoptimizer.h
│  │  │     ├─ arrayList.c/.h
│  │  │     ├─ main.cpp
│  │  │     ├─ mesh_importer.c/.h
│  │  │     └─ vector.h
│  │  └─ Renderer/
│  │     ├─ src/
│  │     │  ├─ camera.c/.h
│  │     │  ├─ color.h
│  │     │  ├─ fixed32.h
│  │     │  ├─ main.c
│  │     │  ├─ mesh.c/.h
│  │     │  ├─ renderer.c/.h
│  │     │  ├─ texture.c/.h
│  │     │  └─ platform/
│  │     │     ├─ VTU.c/.h
│  │     │     ├─ display.h
│  │     │     ├─ display_zybo_hdmi.c
│  │     │     └─ profiler.c/.h
│  │     └─ zybo_z7_hdmi/
│  │        ├─ display_ctrl.c/.h
│  │        ├─ dynclk.c/.h
│  │        └─ vga_modes.h
│  └─ workspace_vitis/
│     └─ renderer/
│        └─ src/
│           ├─ main.c
│           ├─ platform_vitis/
│           └─ rasterizer/
│              ├─ draw.c
│              └─ draw.h
└─ Project Report.pdf
