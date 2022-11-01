# Name: PortEx
# Website: https://github.com/katjahahn/PortEx
# Description: Statically analyze PE files.
# Category: Examine Static Properties: PE Files
# Author: Karsten Hahn: https://twitter.com/struppigel
# License: Apache License 2.0: https://github.com/katjahahn/PortEx/blob/master/LICENSE
# Notes: portex

{%- if grains['oscodename'] == "focal" %}

include:
  - remnux.repos.remnux

portex:
  pkg.installed:
    - version: latest
    - upgrade: True
    - pkgrepo: remnux

{%- elif grains['oscodename'] == "jammy" %}

portex-not-in-jammy:
  test.nop

{% endif %}
