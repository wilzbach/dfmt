@echo off
setlocal enabledelayedexpansion

IF "%DC%"=="" SET DC="dmd"
IF "%MFLAGS%"=="" SET MFLAGS="-m32"

set DFLAGS=-g
set CORE=
set STD=
set STDD=
set STDXALLOCATOR=
set STDXALLOCATORBLOCKS=
set OBIN=bin\dfmt

for %%x in (src\dfmt\*.d) do set CORE=!CORE! %%x
for %%x in (libdparse\src\std\experimental\*.d) do set STD=!STD! %%x
for %%x in (libdparse\src\dparse\*.d) do set STDD=!STDD! %%x
for %%x in (stdx-allocator\source\stdx\allocator\*.d) do set STDXALLOCATOR=!STDXALLOCATOR! %%x
for %%x in (stdx-allocator\source\stdx\allocator\building_blocks\*.d) do set STDXALLOCATORBLOCKS=!STDXALLOCATORBLOCKS! %%x

@echo on
%DC% %CORE% %STD% %STDD% %STDE% %STDXALLOCATOR% %STDXALLOCATORBLOCKS% -I"stdx-allocator\source" -I"libdparse\src" %DFLAGS% %MFLAGS% -of%OBIN%.exe

if exist %OBIN%.obj del %OBIN%.obj
