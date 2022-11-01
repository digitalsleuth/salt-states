saltstack-repo-cleanup:
  pkgrepo.absent:
    - name: deb [arch={{ grains['osarch'] }}] https://repo.saltproject.io/py3/ubuntu/{{ grains['lsb_distrib_release'] }}/{{ grains['osarch'] }}/3001 {{ grains['oscodename'] }} main
    - refresh: true

saltstack-repo:
  pkgrepo.managed:
    - humanname: saltstack
    - name: deb [arch={{ grains['osarch'] }}] https://repo.saltproject.io/salt/py3/ubuntu/{{ grains['lsb_distrib_release'] }}/{{ grains['osarch'] }}/3005 {{ grains['oscodename'] }} main
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: https://repo.saltproject.io/salt/py3/ubuntu/{{ grains['lsb_distrib_release'] }}/{{ grains['osarch'] }}/latest/salt-archive-keyring.gpg
    - gpgcheck: 1
    - refresh: true
    - require:
      - pkgrepo: saltstack-repo-cleanup
