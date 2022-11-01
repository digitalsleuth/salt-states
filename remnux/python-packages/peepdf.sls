# Name: peepdf
# Website: https://eternal-todo.com/tools/peepdf-pdf-analysis-tool
# Description: Examine elements of the PDF file.
# Category: Analyze Documents: PDF
# Author: Jose Miguel Esparza
# License: GNU General Public License (GPL) v3: https://github.com/jesparza/peepdf/blob/master/COPYING
# Notes: 

{% if grains['oscodename'] == 'focal' %}

include:
  - remnux.packages.python2-pip
  - remnux.packages.libemu
  - remnux.packages.libjpeg8-dev
  - remnux.packages.zlib1g-dev
  - remnux.packages.git
  - remnux.packages.python3-pip

remnux-tools-peepdf-source:
  pip.installed:
    - name: git+https://github.com/digitalsleuth/peepdf.git
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: remnux.packages.python2-pip
      - sls: remnux.packages.libemu
      - sls: remnux.packages.libjpeg8-dev
      - sls: remnux.packages.zlib1g-dev
      - sls: remnux.packages.git

{% elif grains['oscodename'] == 'jammy' %}

libemu-not-in-jammy-so-no-peepdf:
  test.nop

{% endif %}
