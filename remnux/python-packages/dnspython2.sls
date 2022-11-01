include:
  - remnux.packages.python2-pip
  - remnux.packages.python3-pip

remnux-python-packages-dnspython:
  pip.installed:
    - name: dnspython
    - bin_env: /usr/bin/python2
    - require:
      - sls: remnux.packages.python2-pip
      - sls: remnux.packages.python3-pip
