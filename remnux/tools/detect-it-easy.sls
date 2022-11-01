# Name: Detect-It-Easy
# Website: https://github.com/horsicq/Detect-It-Easy
# Description: Determine types of files and examine file properties.
# Category: Examine Static Properties: General
# Author: hors: https://twitter.com/horsicq
# License: MIT License: https://github.com/horsicq/Detect-It-Easy/blob/master/LICENSE
# Notes: GUI tool: `die`, command-line tool: `diec`.

{% set version = '3.06' %}
{%- if grains['oscodename'] == "focal" %}
  {% set os_rel = '20.04' %}
  {% set hash = '76fe06a3cd9f45ec9068c6973b1a93cacc71ca36dd6dd3c505987c2dcf7dcc76' %}
{% elif grains['oscodename'] == "jammy" %}
  {% set os_rel = '22.04' %}
  {% set hash = '9b5b5d6b11b3127fcab01efaa54966a65e71a683858ce909667842ded9222b3c' %}
{% endif %}

include:
  - remnux.packages.libglib2
  - remnux.packages.qt5-default
  - remnux.packages.libqt5scripttools5

remnux-tools-detect-it-easy-source:
  file.managed:
    - name: /usr/local/src/remnux/files/die_{{ version }}_Ubuntu_{{ os_rel }}_amd64.deb
    - source: https://github.com/horsicq/DIE-engine/releases/download/{{ version }}/die_{{ version }}_Ubuntu_{{ os_rel }}_amd64.deb
    - source_hash: sha256={{ hash }}
    - makedirs: true

remnux-tools-detect-it-easy-cleanup1:
  file.absent:
    - name: /usr/local/bin/die
    - require:
      - file: remnux-tools-detect-it-easy-source

remnux-tools-detect-it-easy-cleanup2:
  file.absent:
    - name: /usr/local/bin/diec
    - require:
      - file: remnux-tools-detect-it-easy-cleanup1

remnux-tools-detect-it-easy-install:
  pkg.installed:
    - sources:
      - detectiteasy: /usr/local/src/remnux/files/die_{{ version }}_Ubuntu_{{ os_rel }}_amd64.deb
    - require:
      - file: remnux-tools-detect-it-easy-cleanup2
      - sls: remnux.packages.libglib2
      - sls: remnux.packages.qt5-default
      - sls: remnux.packages.libqt5scripttools5
