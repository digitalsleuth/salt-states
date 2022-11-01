{% if grains['oscodename'] == 'focal' %}

exfat-utils:
  pkg.installed

{% elif grains['oscodename'] == 'jammy' %}

exfatprogs:
  pkg.installed

{% endif %}
