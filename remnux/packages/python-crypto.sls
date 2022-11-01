{% if grains['oscodename'] == 'focal' %}

python-crypto:
  pkg.installed

{% elif grains['oscodename'] == 'jammy' %}

include:
  - remnux.packages.python2
  - remnux.packages.python2-pip

remnux-packages-python-crypto-download:
  file.managed:
    - name: /usr/local/src/remnux/files/python-crypto_2.6.1-13ubuntu2_amd64.deb
    - source: https://launchpad.net/ubuntu/+archive/primary/+files/python-crypto_2.6.1-13ubuntu2_amd64.deb
    - source_hash: sha256=2e8b2151fcc08063dff6c39b31a620d2f7481663dabb4b3354d1bade816f1c8b
    - makedirs: True

remnux-packages-python-crypto-install:
  pkg.installed:
    - sources:
      - python-crypto: /usr/local/src/remnux/files/python-crypto_2.6.1-13ubuntu2_amd64.deb
    - watch:
      - file: remnux-packages-python-crypto-download
    - require:
      - sls: remnux.packages.python2
      - sls: remnux.packages.python2-pip

{% endif %}
