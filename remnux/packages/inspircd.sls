# Name: inspircd 3
# Website: https://www.inspircd.org/
# Description: Examine IRC activity with this IRC server.
# Category: Explore Network Interactions: Services
# Author: InspIRCd Development Team
# License: GNU General Public License (GPL) v2: https://docs.inspircd.org/license/
# Notes: 

{% set version = '3.14.0' %}
{%- if grains['oscodename'] == "focal" %}
  {% set os_rel = '20.04.1' %}
  {% set hash = '4ffd60405f25326867f2a4c38dcbba4aa38fe2045808bfc19b80fbe2920aa967' %}
{% elif grains['oscodename'] == "jammy" %}
  {% set os_rel = '22.04.1' %}
  {% set hash = '532fe6f88d0ef3c9412caf98352d9a8277b1525530d814e349b689c3c6de7441' %}
{% endif %}

include:
  - remnux.packages.libpq5
  - remnux.packages.libre2-9
  - remnux.packages.libtre5
  - remnux.packages.gnutls-bin

remnux-packages-inspircd-source:
  file.managed:
    - name: /usr/local/src/inspircd_{{ version }}.ubuntu{{ os_rel }}_amd64.deb
    - source: https://github.com/inspircd/inspircd/releases/download/v{{ version }}/inspircd_{{ version }}.ubuntu{{ os_rel }}_amd64.deb
    - source_hash: sha256={{ hash }}

remnux-packages-inspircd-install:
  pkg.installed:
    - sources:
      - inspircd: /usr/local/src/inspircd_{{ version }}.ubuntu{{ os_rel }}_amd64.deb
    - require:
      - sls: remnux.packages.libpq5
      - sls: remnux.packages.libre2-9
      - sls: remnux.packages.libtre5
      - sls: remnux.packages.gnutls-bin
    - watch:
      - file: remnux-packages-inspircd-source

# Runlevel isn't in a Docker container, so check whether it exists before
# trying to control services
{%- if salt['file.file_exists']('/sbin/runlevel') %}

inspircd-service:
  service.dead:
    - name: inspircd
    - enable: False
    - watch:
      - pkg: remnux-packages-inspircd-install

{% endif %}
