# Name: StringSifter
# Website: https://github.com/fireeye/stringsifter
# Description: Automatically rank strings based on their relevance to the analysis of suspicious Windows executables.
# Category: Examine Static Properties: PE Files
# Author: FireEye Inc.
# License: Apache License 2.0: https://github.com/fireeye/stringsifter/blob/master/LICENSE
# Notes: flarestrings

{% if grains['oscodename'] == 'focal' %}

include:
  - remnux.python3-packages.pip

remnux-python3-packages-stringsifter:
  pip.installed:
    - name: stringsifter
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: remnux.python3-packages.pip

{% elif grains['oscodename'] == 'jammy' %}

stringsifter-not-supported-in-jammy:
  test.nop

{% endif %}
