include:
  - remnux.packages.python2
  - remnux.packages.python2-pip

numpy:
  pip.installed:
    - bin_env: /usr/bin/python2
    - require:
      - sls: remnux.packages.python2
      - sls: remnux.packages.python2-pip
