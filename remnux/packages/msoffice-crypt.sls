# Name: msoffice-crypt
# Website: https://github.com/herumi/msoffice
# Description: Encrypt and decrypt OOXML Microsoft Office documents.
# Category: Analyze Documents: Microsoft Office
# Author: Cybozu Labs Inc., Mitsunari Shigeo: https://twitter.com/herumi
# License: Free, custom license: https://github.com/herumi/msoffice/blob/master/COPYRIGHT
# Notes: 

{%- if grains['oscodename'] == "focal" %}

include:
  - remnux.repos.remnux

msoffice-crypt:
  pkg.installed:
    - pkgrepo: remnux

{%- elif grains['oscodename'] == "jammy" %}

msoffice-crypt-not-in-jammy:
  test.nop

{% endif %}
