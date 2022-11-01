# Name: bulk_extractor
# Website: https://github.com/simsong/bulk_extractor/
# Description: Extract interesting strings from binary files.
# Category: Examine Static Properties: General, Perform Memory Forensics
# Author: https://github.com/simsong/bulk_extractor/blob/master/AUTHORS
# License: Portions Public Domain, portions MIT License: https://github.com/simsong/bulk_extractor/blob/master/LICENSE.md
# Notes: 

{% set files = ['build_stoplist.py', 'bulk_diff.py', 'cda_tool.py', 'post_process_exif.py'] %}
{% if grains['oscodename'] == 'focal' %}
  {% set py_ver = 'python3.8' %}
{% elif grains['oscodename'] == 'jammy' %}
  {% set py_ver = 'python3.10' %}
{% endif %}

include:
  - remnux.packages.build-essential
  - remnux.packages.libssl-dev
  - remnux.packages.flex
  - remnux.packages.libewf2
  - remnux.packages.libewf-dev
  - remnux.packages.libexpat1-dev
  - remnux.packages.libxml2-utils
  - remnux.packages.libtool
  - remnux.packages.pkg-config
  - remnux.packages.zlib1g-dev
  - remnux.packages.make
  - remnux.packages.git

bulk-extractor-source:
  git.latest:
    - name: https://github.com/simsong/bulk_extractor
    - target: /usr/local/src/bulk_extractor
    - user: root
    - rev: main
    - submodules: True
    - force_clone: True
    - force_reset: True
    - require:
      - sls: remnux.packages.build-essential
      - sls: remnux.packages.libssl-dev
      - sls: remnux.packages.flex
      - sls: remnux.packages.libewf2
      - sls: remnux.packages.libewf-dev
      - sls: remnux.packages.libexpat1-dev
      - sls: remnux.packages.libxml2-utils
      - sls: remnux.packages.libtool
      - sls: remnux.packages.pkg-config
      - sls: remnux.packages.zlib1g-dev
      - sls: remnux.packages.make
      - sls: remnux.packages.git

bulk-extractor-build:
  cmd.run:
    - names:
      - ./bootstrap.sh
      - ./configure
      - make
      - make install
    - cwd: /usr/local/src/bulk_extractor
    - require:
      - git: bulk-extractor-source

{% for file in files %}

bulk-extractor-{{ file }}:
  file.managed:
    - name: /usr/local/bin/{{ file }}
    - source: /usr/local/src/bulk_extractor/python/{{ file }}
    - user: root
    - group: root
    - makedirs: True
    - mode: 0755
    - require:
      - git: bulk-extractor-source

{% endfor %}

bulk-extractor-bulk-extractor-reader:
  file.managed:
    - name: /usr/local/lib/{{ py_ver }}/dist-packages/bulk_extractor_reader.py
    - source: /usr/local/src/bulk_extractor/python/bulk_extractor_reader.py
    - user: root
    - group: root
    - makedirs: True
    - mode: 0644
    - require:
      - git: bulk-extractor-source

bulk-extractor-cleanup:
  file.absent:
    - name: /usr/local/src/bulk_extractor
    - require:
      - cmd: bulk-extractor-build
