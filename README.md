# 3D Software Renderer with FPGA Hardware Acceleration on Zynq-7000

## Overview

This project is a **from-scratch 3D renderer** for the Zynq-7000 (Zybo Z7-10) that combines:
- a **software rasterizer** in bare-metal C running on the ARM **Cortex-A9**
- a lightweight **FPGA Vertex Transform Unit (VTU)** in the PL that offloads matrix transforms.

## Demo Video
[![Watch the demo](https://img.youtube.com/vi/xsQ5klnrDiM?si=pu4Sd3zznvZ_XwqU/hqdefault.jpg)](https://youtu.be/xsQ5klnrDiM?si=pu4Sd3zznvZ_XwqU "Watch the demo on YouTube")


### Data & rendering pipeline
1. **Offline preprocessing (host):**  
   `MeshImporter` ingests `.obj`, optionally reorders/optimizes indices, and writes a binary `.msh`.
2. **Load on target (PS):**  
   The app loads `.msh` into DDR, sets up camera/projection, and configures VTU.
3. **Vertex stage (PL):**  
   VTU transofrms vertex buffers.
4. **Raster stage (PS):**  
   Back-face culling → triangle edge setup → half egde-incremental rasterization with **depth testing** and **shading**.
5. **Scan-out (PL):**  
   The DDR framebuffer is scanned to HDMI through the `RGB2DVI` pipeline to a monitor.

### Prerequisites
- **Board:** Digilent Zybo Z7-10  
- **Tools:** Xilinx **Vivado 2024.2** + **Vitis Classic**
- **Cables:** Micro-USB/JTAG for programming, HDMI cable to a monitor  
---

## Vivado Project Setup (HW)

1. **Create a Vivado project** targeting **Zybo Z7-10**
2. **Add the HDMI IP repository:**
`Tools → Settings → IP → Repository` → **Add** `HW/3rd-party/HDMI`
3. **Add RTL source:**
   `Add Sources → Add or Create Design Sources` → add `HW/src/VTU.v`
4. **Add constraints:**  
   `Add Sources → Add or Create Constraints` → add `HW/constr/Zybo-Z7-Master.xdc`
5. **Create the block design via Tcl:** open the Tcl Console and run:
```tcl source HW/MainBlock.tcl```
*(This instantiates the top-level design; it references `HW/hdmi.tcl` for the HDMI block.)*

6. **Set top & wrapper:** In the Block Design, **Create HDL Wrapper** and set `MainBlock` as top.
7. **Build:** `Run Synthesis → Run Implementation → Generate Bitstream`.


## Vitis Project Setup (SW)
1. Launch **Vitis Classic** (same version as Vivado).
2. `File → Import… → Vitis → Import Vitis Project`
3. Point to **`SW/vitis_export_archive.ide.zip`** and finish.

## Running on Hardware
1. Connect HDMI from the Zybo’s TX port to a monitor.
2. Copy DEMO folder contents to **SD** and insert in Zybo.
2. Build Vitis Project
3. Launch the app in Vitis: right-click the application → **Run As → Launch on Hardware**


---

## Acknowledgements
- RTSYork zybo‑z7‑hdmi https://github.com/RTSYork/zybo-z7-hdmi
- Digilent RGB2DVI/ DynClock https://github.com/Digilent/vivado-library/tree/master
- meshoptimizer https://github.com/zeux/meshoptimizer
