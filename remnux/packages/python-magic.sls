{% if grains['oscodename'] == 'focal' %}

python-magic:
  pkg.installed

{% elif grains['oscodename'] == 'jammy' %}
include:
  - remnux.packages.python2-pip
  - remnux.packages.python3-pip

libmagic1:
  pkg.installed

python-magic:
  pip.installed:
    - bin_env: /usr/bin/python2
    - require:
      - pkg: libmagic1

{% endif %}
