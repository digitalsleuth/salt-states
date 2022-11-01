# Name: Sleuth Kit
# Website: https://www.sleuthkit.org/sleuthkit
# Description: Analyze disk images and recover files from them.
# Category: Examine Static Properties: General
# Author: Brian Carrier, and others
# License: IBM Public License,  Common Public License, GNU General Public License (GPL) v2: https://www.sleuthkit.org/sleuthkit/licenses.php
# Notes: For a listing of commands, see http://wiki.sleuthkit.org/index.php?title=TSK_Tool_Overview

{% if grains['oscodename'] == 'focal' %}

include:
  - remnux.repos.gift

remnux-packages-sleuthkit:
  pkg.installed:
    - name: sleuthkit
    - pkgrepo: gift-repo

{% elif grains['oscodename'] == 'jammy' %}

sleuthkit:
  pkg.installed

{% endif %}
