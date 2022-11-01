# Name: JD-GUI Java Decompiler
# Website: https://java-decompiler.github.io/
# Description: Java decompiler with GUI
# Category: Statically Analyze Code: Java
# Author: Emmanuel Dupuy
# License: GNU General Public License (GPL) v3: https://github.com/java-decompiler/jd-gui/blob/master/LICENSE
# Notes: jd-gui

{% if grains['oscodename'] == 'focal' %}

include:
  - remnux.packages.xdg-utils
  - remnux.repos.remnux

remnux-xdg-directory-create:
  file.directory:
    - names: 
      - /usr/share/desktop-directories/
      - /usr/share/icons/hicolor/    
    - user: root
    - group: root
    - mode: 755
    - makedirs: true
    - watch:
      - sls: remnux.packages.xdg-utils

jd-gui:
  pkg.installed

{% elif grains['oscodename'] == 'jammy' %}

jd-gui-not-in-jammy:
  test.nop

{% endif %}
