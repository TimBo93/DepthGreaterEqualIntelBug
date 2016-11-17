# DepthGreaterEqualIntelBug
A minimal example that shows problems with the SV_DepthGreaterEqual Semantic and Intel HD4600 with Windows 7 Drivers.

There seem to be serious problems with the Intel Graphics HD 4600 on Windows 7 when using the SV_DepthGreaterEqual semantics (or SV_DepthLessEqual). This semantic can be used to allow the hardware to use early z testing in case the pixel shader has to write the depth value. Using it on the pixel shader output it guarantees that the depth value writte by the pixel shader will be greater or equal to the value from the previous stage.
On the Intel HD Graphics 4600 using Windows 10 and latest drivers (installed by Windows Update) this works like expected (see right in the image below). If the same program is executed on Intel HD Graphics 4600 on Windows 7 (with latest drivers for Windows 7) wrong pixels are culled by the z test (see left in the image below).
![alt tag](https://github.com/TimBo93/DepthGreaterEqualIntelBug/raw/master/Images/BugVsExpected.jpg)
