# DepthGreaterEqualIntelBug
A minimal example that shows problems with the SV_DepthGreaterEqual Semantic and Intel HD Graphics 4600 with Windows 7 Drivers.

You can find the bug report at intel forum : https://software.intel.com/en-us/forums/graphics-driver-bug-reporting/topic/703401

There seem to be serious problems with the Intel HD Graphics 4600 on Windows 7 when using the SV_DepthGreaterEqual semantics (or SV_DepthLessEqual). This semantic can be used to allow the hardware to use early z testing in case the pixel shader has to write the depth value. Using it on the pixel shader output it guarantees that the depth value writte by the pixel shader will be greater or equal to the value from the previous stage.


On the Intel HD Graphics 4600 using Windows 10 and latest drivers (installed by Windows Update) this works like expected (see right in the image below). If the same program is executed on Intel HD Graphics 4600 on Windows 7 (with latest drivers for Windows 7) wrong pixels are culled by the z test (see left in the image below).


The repository contains a minimal example that shows the problem (source code an binaries). Execute the Tutorial2.exe on Windows 7 with Intel HD Graphics 4600 to reproduce the problem. The problem also occures with some other Intel HD Graphics on Windows 7 (for example Atom E3845). We could not observe the error on AMD or NVIDIA cards. 

![alt tag](https://github.com/TimBo93/DepthGreaterEqualIntelBug/raw/master/Images/BugVsExpected.jpg)


##Bug occures on

* System Used: (Manufacturer/Model)
* CPU SKU: i5
* GPU SKU: Intel HD Graphics 4600
* Processor Line: ?
* System BIOS Version: ?
* CMOS settings: ?
* Graphics Driver Version: 10.18.14.4414
* GOP/VBIOS Version: ?
* Operating System: Windows 7
* OS Version: SP1 Version 6.1
* API: Direct3D 11 Shader Model 5
* Occurs on non-Intel GPUs?: No




## The example scene
The depth buffer is cleared with z= 1.0. The z-test function is set to less (D3D11_COMPARISON_LESS). The vertices of the triangle in the example scene are at depth z=0.5 and the pixel shader changes this depth to z=0.7 (with output semantic DepthGreaterEqual).
![alt tag](https://github.com/TimBo93/DepthGreaterEqualIntelBug/raw/master/Images/Scene.jpg)


The VS Graphical Debugger shows that the pixels are culled by the z test. 
![alt tag](https://github.com/TimBo93/DepthGreaterEqualIntelBug/raw/master/Images/GraphicalDebugger.PNG)


