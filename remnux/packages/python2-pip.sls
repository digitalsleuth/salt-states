include:
  - remnux.packages.python2
  - remnux.packages.curl

remnux-packages-python2-pip-install-script:
  cmd.run:
    - name: curl -o /tmp/get-pip.py https://bootstrap.pypa.io/pip/2.7/get-pip.py
    - unless: which pip2
    - require:
      - sls: remnux.packages.python2
      - sls: remnux.packages.curl

remnux-packages-python2-pip-install:
  cmd.run:
    - name: python2 /tmp/get-pip.py
    - unless: which pip2
    - require:
      - cmd: remnux-packages-python2-pip-install-script
