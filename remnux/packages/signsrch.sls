# Name: signsrch
# Website: http://aluigi.altervista.org/mytoolz.htm
# Description: Find patterns of common encryption, compression, or encoding algorithms
# Category: Examine Static Properties: General
# Author: Luigi Auriemma
# License: Free, unknown license
# Notes: 

{%- if grains['oscodename'] == "focal" %}

include:
  - remnux.repos.remnux

signsrch:
  pkg.installed

{%- elif grains['oscodename'] == "jammy" %}

signsrch-not-in-jammy:
  test.nop

{% endif %}
