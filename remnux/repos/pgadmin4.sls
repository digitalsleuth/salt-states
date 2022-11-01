pgadmin:
  pkgrepo.managed:
    - humanname: pgadmin-repo
    - name: deb [arch=amd64] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/{{ grains['oscodename'] }} pgadmin4 main
    - file: /etc/apt/sources.list.d/pgadmin4.list
    - key_url: https://www.pgadmin.org/static/packages_pgadmin_org.pub
    - refresh: true
