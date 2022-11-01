include:
  - remnux.packages.python3
  - remnux.packages.python3-pip

remnux-python3-packages-dnspython:
  pip.installed:
    - name: dnspython
    - bin_env: /usr/bin/python3
    - require:
      - sls: remnux.packages.python3
      - sls: remnux.packages.python3-pip
