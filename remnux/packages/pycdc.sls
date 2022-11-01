# Name: Decompyle++
# Website: https://github.com/zrax/pycdc
# Description: Python bytecode disassembler and decompiler
# Category: Statically Analyze Code: Python
# Author: Michael Hansen, Darryl Pogue
# License: GNU General Public License (GPL) v3: https://github.com/zrax/pycdc/blob/master/LICENSE
# Notes: pycdas, pycdc

{%- if grains['oscodename'] == "focal" %}

include:
  - remnux.repos.remnux

pycdc:
  pkg.installed

{%- elif grains['oscodename'] == "jammy" %}

pycdc-not-in-jammy:
  test.nop

{% endif %}
