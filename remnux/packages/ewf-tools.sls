include:
  - remnux.packages.libewf2
  - remnux.packages.libfuse2

ewf-tools:
  pkg.installed:
    - require:
      - sls: remnux.packages.libewf2
      - sls: remnux.packages.libfuse2
