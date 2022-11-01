# Name: baksmali
# Website: https://bitbucket.org/JesusFreke/smali
# Description: Disassembler for the dex format used by Dalvik, Android's Java VM implementation.
# Category: Statically Analyze Code: Android
# Author: Ben Gruver
# License: Free, unknown license
# Notes: 

{%- if grains['oscodename'] == "focal" %}

include:
  - remnux.repos.remnux

baksmali:
  pkg.installed:
    - version: latest
    - upgrade: True
    - pkgrepo: remnux

{%- elif grains['oscodename'] == "jammy" %}

baksmali-not-in-jammy:
  test.nop

{% endif %}
