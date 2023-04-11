remnux-draios-key:
  file.managed:
    - name: /usr/share/keyrings/DRAIOS-GPG-KEY.asc
    - source: https://download.sysdig.com/DRAIOS-GPG-KEY.public
    - skip_verify: True
    - makedirs: True

draios:
  pkgrepo.managed:
    - humanname: Draios
    - name: deb [arch={{ grains['osarch'] }} signed-by=/usr/share/keyrings/DRAIOS-GPG-KEY.asc] https://download.sysdig.com/stable/deb stable-{{ grains['osarch'] }}/
    - file: /etc/apt/sources.list.d/draios.list
    - refresh: true
    - clean_file: true
    - require:
      - file: remnux-draios-key
