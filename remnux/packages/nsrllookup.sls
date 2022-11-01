# Name: nsrllookup
# Website: https://github.com/rjhansen/nsrllookup
# Description: Look up MD5 file hashes in the NIST National Software Reference Library (NSRL).
# Category: Gather and Analyze Data
# Author: Robert J. Hansen: https://twitter.com/robertjhansen
# License: ISC License: https://github.com/rjhansen/nsrllookup/blob/master/LICENSE
# Notes:

{%- if grains['oscodename'] == "focal" %}

include:
  - remnux.repos.remnux
  
nsrllookup:
  pkg.installed:
    - version: latest
    - upgrade: True
    - pkgrepo: remnux

{%- elif grains['oscodename'] == "jammy" %}

nsrllookup-not-in-jammy:
  test.nop

{% endif %}
