# ZyboZ7_10_Renderer

link renderer: https://github.com/VictorK96/SoftwareRenderer


When you download the project you should make your projects (vitis[classic] vivado) with name workspace_vivado and workspace_vitis

take vivado project, delete folder workspace_vivado.srcs and make link from (your project)workspace_vivado/worspace_vivado.srcs to (git project)workspace_vivado/worspace_vivado.srcs

do bitstream
export

then when create vitis project make project renderer
then delete folder workdpace_vitis/renderer/src and make link from (your project)workdpace_vitis/renderer/src (git project)workdpace_vitis/renderer/src