# Name: SpiderMonkey
# Website: https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonkey
# Description: Execute and deobfuscate JavaScript using Mozilla's standalone JavaScript engine.
# Category: Dynamically Reverse-Engineer Code: Scripts
# Author: Mozilla Foundation
# License: Mozilla Public License 2.0: https://github.com/mozilla/treeherder/blob/master/LICENSE.txt
# Notes: js

{% if grains['oscodename'] == 'focal' %}
  {% set jsver = '52' %}
{% elif grains['oscodename'] == 'jammy' %}
  {%set jsver = '91' %}
{% endif %}

libmozjs-{{ jsver }}-dev:
  pkg.installed

remnux-packages-spidermonkey-config:
  alternatives.install:
    - name: js
    - link: /usr/bin/js
    - path: /usr/bin/js{{ jsver }}
    - priority: 300
    - watch:
      - pkg: libmozjs-{{ jsver }}-dev
