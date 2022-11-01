# Name: sandfly-processdecloak
# Website: https://github.com/sandflysecurity/sandfly-processdecloak
# Description: Find hidden processes on the local Linux system.
# Category: Investigate System Interactions
# Author: Sandfly Security: https://twitter.com/SandflySecurity
# License: MIT License: https://github.com/sandflysecurity/sandfly-processdecloak/blob/master/LICENSE
# Notes: 

{%- if grains['oscodename'] == "focal" %}

include:
  - remnux.repos.remnux
  
sandfly-processdecloak:
  pkg.installed:
    - version: latest
    - upgrade: True
    - pkgrepo: remnux

{%- elif grains['oscodename'] == "jammy" %}

sandfly-processdecloak-not-in-jammy:
  test.nop

{% endif %}
