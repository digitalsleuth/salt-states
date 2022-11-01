# Name: dex2jar
# Website: https://github.com/pxb1988/dex2jar
# Description: Examine Dalvik Executable (dex) files.
# Category: Statically Analyze Code: Android
# Author: Panxiaobo
# License: Apache License 2.0: https://github.com/pxb1988/dex2jar/blob/2.x/LICENSE.txt
# Notes: dex-tools

{%- if grains['oscodename'] == "focal" %}

include:
  - remnux.repos.remnux
  
dex2jar:
  pkg.installed:
    - version: latest
    - upgrade: True
    - pkgrepo: remnux

{% elif grains['oscodename'] == 'jammy' %}

dex2jar-not-in-jammy:
  test.nop

{% endif %}
