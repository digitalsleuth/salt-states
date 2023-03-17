# Name: tcpflow
# Website: http://downloads.digitalcorpora.org/downloads/tcpflow/
# Description: Analyze the flow of network traffic.
# Category: Explore Network Interactions: Monitoring
# Author: Simson L. Garfinkel
# License: GNU General Public License (GPL) v3: https://github.com/simsong/tcpflow/blob/master/COPYING
# Notes: 

{% if grains['oscodename'] == 'focal' %}

include:
  - remnux.repos.remnux

tcpflow:
  pkg.installed

{% elif grains['oscodename'] == 'jammy' %}

tcpflow:
  pkg.installed

{% endif %}
