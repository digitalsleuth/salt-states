# Name: XORStrings
# Website: https://blog.didierstevens.com/2013/04/15/new-tool-xorstrings/
# Description: Search for XOR encoded strings in a file.
# Category: Examine Static Properties: Deobfuscation
# Author: Didier Stevens
# License: Free, unknown license
# Notes:

{% if grains['oscodename'] == 'focal' %}

include:
  - remnux.repos.remnux

xorstrings:
  pkg.installed

{% elif grains['oscodename'] == 'jammy' %}

xorstrings-not-in-jammy:
  test.nop

{% endif %}
