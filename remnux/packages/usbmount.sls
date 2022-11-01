{% if grains['oscodename'] == 'focal' %}

usbmount:
  pkg.installed

{% elif grains['oscodename'] == 'jammy' %}

usbmount-not-in-jammy:
  test.nop

{% endif %}
