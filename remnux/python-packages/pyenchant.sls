include:
  - remnux.packages.python3-pip
  - remnux.packages.enchant

remnux-python-packages-pyenchant:
  pip.installed:
    - name: pyenchant
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: remnux.packages.enchant
      - sls: remnux.packages.python3-pip
