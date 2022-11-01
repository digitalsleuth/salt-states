{% if grains['oscodename'] == 'focal' %}

remnux-package-qt5-default:
  pkg.installed:
    - name: qt5-default

{% else %}

qt5-not-on-jammy:
  test.nop

{% endif %}
