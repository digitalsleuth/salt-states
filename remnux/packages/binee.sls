# Name: binee (Binary Emulation Environment)
# Website: https://github.com/carbonblack/binee
# Description: Analyze I/O operations of a suspicious PE file by emulating its execution.
# Category: Statically Analyze Code: PE Files
# Author: Carbon Black, Kyle Gwinnup, John Holowczak
# License: GNU General Public License (GPL) v2: https://github.com/carbonblack/binee/blob/master/LICENSE
# Notes: Before using this tool, place the files your sample requires under /opt/binee-files/win10_32. For example, the Windows DLLs it needs should go /opt/binee-files/win10_32/windows/system32. If you have a Windows 10 64-bit system, you can get the 32-bit DLLs from C:\Windows\SysWOW64 To  check which DLLs you might need by examining the import table using the "-i" parameter.

{%- if grains['oscodename'] == "focal" %}

include:
  - remnux.repos.remnux
  
binee:
  pkg.installed:
    - version: latest
    - upgrade: True
    - pkgrepo: remnux

{%- elif grains['oscodename'] == "jammy" %}

binee-not-in-jammy:
  test.nop

{% endif %}
