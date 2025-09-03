# 3D Software Renderer with FPGA Hardware Acceleration on Zynq-7000

Offline mesh preprocessing and a fixed‑function software renderer accelerated by a custom FPGA block (Vertex Transform Unit) on Digilent Zybo Z7‑10 (Zynq‑7000). HDMI video output is provided via the RTSYork zybo‑z7‑hdmi IP.

- Hardware: see [HW/](HW)
  - Block design script: [HW/MainBlock.tcl](HW/MainBlock.tcl)
  - HDMI helper IP: [HW/3rd-party/HDMI](HW/3rd-party/HDMI)
  - Constraints: [HW/constr/Zybo-Z7-Master.xdc](HW/constr/Zybo-Z7-Master.xdc)
  - Vertex Transform Unit RTL: [HW/src/VTU.v](HW/src/VTU.v)
  - Exported XSA (example): [HW/MainBlock_wrapper.xsa](HW/MainBlock_wrapper.xsa)
- Software: see [SW/](SW)
  - Vitis export: [SW/vitis_export_archive.ide.zip](SW/vitis_export_archive.ide.zip)
  - Mesh Importer (offline preprocessing): [SW/src/MeshImporter](SW/src/MeshImporter)
    - Mesh optimizer example: [SW/src/MeshImporter/src/MeshOptimizer/indexgenerator.cpp](SW/src/MeshImporter/src/MeshOptimizer/indexgenerator.cpp)
  - Renderer (runtime): [SW/src/Renderer](SW/src/Renderer)
    - App entry: [SW/src/Renderer/src/main.c](SW/src/Renderer/src/main.c)
    - Renderer: [SW/src/Renderer/src/renderer.c](SW/src/Renderer/src/renderer.c)
    - Mesh I/O: [SW/src/Renderer/src/mesh.c](SW/src/Renderer/src/mesh.c)


## Targets
Built for the Open Hardware Competition (Adaptive Computing). Goal: improve rendering performance via FPGA acceleration.

## Development Environment
- Vivado v2024.2 (64‑bit)
- Vitis v2024.2 (64‑bit)
- Board: Digilent Zybo Z7‑10
- microSD card (FAT32), HDMI monitor/capture device, mini/micro‑USB cable



## Project helped lib
- exlanation https://uoy.atlassian.net/wiki/spaces/RTS/pages/35688270/Zybo+Z7+HDMI+Output
- github https://github.com/RTSYork/zybo-z7-hdmi
    
## Project Structure
- /project root/
  - [HW/](HW) — hardware design (Tcl scripts, RTL, constraints, third‑party HDMI IP)
  - [SW/](SW) — software (Vitis export, source for MeshImporter and Renderer)
  - Project Report.pdf
  - README.MD (this file)

- /HW/
  - [hdmi.tcl](HW/hdmi.tcl) — create HDMI block
  - [MainBlock.tcl](HW/MainBlock.tcl) — create top‑level block design
  - [MainBlock_wrapper.xsa](HW/MainBlock_wrapper.xsa) — example XSA from generated bitstream
  - [3rd-party/HDMI](HW/3rd-party/HDMI) — HDMI IP (see [License.txt](HW/3rd-party/HDMI/License.txt), [README.md](HW/3rd-party/HDMI/README.md))
  - [constr/Zybo-Z7-Master.xdc](HW/constr/Zybo-Z7-Master.xdc) — constraints
  - [src/VTU.v](HW/src/VTU.v) — Vertex Transform Unit (FPGA accelerator)

- /SW/
  - [vitis_export_archive.ide.zip](SW/vitis_export_archive.ide.zip) — Vitis workspace export
  - /src/
    - [MeshImporter](SW/src/MeshImporter) — converts .obj to optimized .msh
    - [Renderer](SW/src/Renderer) — loads .msh and renders to HDMI

## Pipelines

### MeshImporter (offline, on board via SD)
- Parse Wavefront OBJ
- Triangulate
- Tangent/bitangent generation
- Index optimization
- Output: .msh written to SD card

Key source: [SW/src/MeshImporter/src/MeshOptimizer/indexgenerator.cpp](SW/src/MeshImporter/src/MeshOptimizer/indexgenerator.cpp)

### Renderer (runtime, on board)
- Geometry Processing (CPU + VTU)
  - Vertex transforms (see [HW/src/VTU.v](HW/src/VTU.v))
  - Culling, clipping
- Rasterization
  - Coverage test, attribute interpolation
- Fragment Processing
  - Lighting, texturing, color
- Fragment Merge
  - Z‑test, blending, framebuffer writeback
- HDMI output

Key sources: [SW/src/Renderer/src/renderer.c](SW/src/Renderer/src/renderer.c), [SW/src/Renderer/src/mesh.c](SW/src/Renderer/src/mesh.c), [SW/src/Renderer/src/main.c](SW/src/Renderer/src/main.c)


## Quick Start

### Option A (Vitis Export)
- Import the provided workspace export [SW/vitis_export_archive.ide.zip](SW/vitis_export_archive.ide.zip)

#### Run on Board
1. Insert SD card into Zybo Z7‑10
2. Connect HDMI OUT to a display
3. In Vitis, run MeshImporter on hardware to generate .msh files onto the SD card
4. Run Renderer on hardware


### Option B (Vivado - Vitis Build)

#### Vivado
1. Open Vivado 2024.2, create a project for Zybo Z7‑10.
2. Add IP repository: [HW/3rd-party/HDMI](HW/3rd-party/HDMI).
3. Add constraints: [HW/constr/Zybo-Z7-Master.xdc](HW/constr/Zybo-Z7-Master.xdc).
4. Source block design script: [HW/MainBlock.tcl](HW/MainBlock.tcl) (Tools → Run Tcl Script).
5. Generate bitstream, then File → Export Hardware (include bitstream) to produce an XSA (e.g. [HW/MainBlock_wrapper.xsa](HW/MainBlock_wrapper.xsa)).

#### Vitis

1. Create a new Vitis workspace targeting your exported XSA
2. Create two apps:
    - MeshImporter app: import sources from [SW/src/MeshImporter](SW/src/MeshImporter).
    - Renderer app: import sources from [SW/src/Renderer](SW/src/Renderer).

#### Run on Board
1. Insert SD card into Zybo Z7‑10
2. Connect HDMI OUT to a display
3. In Vitis, run MeshImporter on hardware to generate .msh files onto the SD card
4. Run Renderer on hardware



## Acknowledgements
- RTSYork zybo‑z7‑hdmi
  - Docs: https://uoy.atlassian.net/wiki/spaces/RTS/pages/35688270/Zybo+Z7+HDMI+Output
  - GitHub: https://github.com/RTSYork/zybo-z7-hdmi
  - See [HW/3rd-party/HDMI/License.txt](HW/3rd-party/HDMI/License.txt)
