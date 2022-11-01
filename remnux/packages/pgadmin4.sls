include:
  - remnux.repos.pgadmin4

pgadmin4:
  pkg.installed:
    - version: latest
    - upgrade: True
    - pkgrepo: pgadmin4
