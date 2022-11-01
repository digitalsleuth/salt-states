# Name: XORSearch
# Website: https://blog.didierstevens.com/programs/xorsearch/
# Description: Locate and decode strings obfuscated using common techniques.
# Category: Examine Static Properties: Deobfuscation, Dynamically Reverse-Engineer Code: Shellcode
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes: xorsearch

{%- if grains['oscodename'] == "focal" %}

include:
  - remnux.repos.remnux
  
xorsearch:
  pkg.installed:
    - version: latest
    - upgrade: True
    - pkgrepo: remnux

{%- elif grains['oscodename'] == "jammy" %}

xorsearch-not-in-jammy:
  test.nop

{% endif %}
