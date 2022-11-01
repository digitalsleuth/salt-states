# Name: STPyV8
# Website: https://github.com/cloudflare/stpyv8
# Description: Python3 and JavaScript interop engine, fork of the original PyV8 project
# Category: Dynamically Reverse-Engineer Code: Scripts
# Author: Area1 Security
# License: Apache License 2.0: https://github.com/cloudflare/stpyv8/blob/master/LICENSE.txt
# Notes:
{%- set version="v10.5.218.7" %}
{% if grains['oscodename'] == "focal" %} 
  {%- set release="stpyv8-ubuntu-20.04-python-3.8.zip" %}
  {%- set hash="6c8ad89b36c8563d610095fc61e5d6892ef5907d40273e40b87688102438d121" %}
  {%- set wheel="stpyv8-10.5.218.7-cp38-cp38-linux_x86_64.whl" %}
  {%- set folder="stpyv8-ubuntu-20.04-3.8" %}
{% elif grains['oscodename'] == "jammy" %} 
  {%- set release="stpyv8-ubuntu-22.04-python-3.10.zip" %}
  {%- set hash="186e0dbb12c641b3c9493ecdded093a743842ed1f2ab8889ffa16bdb7d14e434" %}
  {%- set wheel="stpyv8-10.5.218.7-cp310-cp310-linux_x86_64.whl" %}
  {%- set folder="stpyv8-ubuntu-22.04-3.10" %}

{%- endif %}

include:
  - remnux.packages.sudo
  - remnux.packages.libboost-python-dev
  - remnux.packages.libboost-system-dev
  - remnux.packages.libboost-iostreams-dev
  - remnux.packages.libboost-dev
  - remnux.packages.build-essential
  - remnux.python3-packages.pip
  - remnux.python3-packages.setuptools

remnux-python3-packages-stpyv8-source:
  file.managed:
    - name: /usr/local/src/remnux/files/{{ release }}
    - source: https://github.com/cloudflare/stpyv8/releases/download/{{ version }}/{{ release }}
    - source_hash: sha256={{ hash }}
    - makedirs: True

remnux-python3-packages-stpyv8-archive:
  archive.extracted:
    - name: /usr/local/src/remnux/
    - source: /usr/local/src/remnux/files/{{ release }}
    - enforce_toplevel: False
    - watch:
      - file: remnux-python3-packages-stpyv8-source

remnux-pip3-stpyv8:
  pip.installed:
    - name: /usr/local/src/remnux/{{ folder }}/{{ wheel }}
    - bin_env: /usr/bin/python3
    - require:
      - sls: remnux.python3-packages.pip
      - sls: remnux.packages.sudo
      - sls: remnux.packages.libboost-python-dev
      - sls: remnux.packages.libboost-system-dev
      - sls: remnux.packages.libboost-dev
      - sls: remnux.packages.libboost-iostreams-dev
      - sls: remnux.python3-packages.setuptools
