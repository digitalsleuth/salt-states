# Name: qpdf
# Website: http://qpdf.sourceforge.net/
# Description: Manipulate (merge, convert, transform) PDF files.
# Category: Analyze Documents: PDF
# Author: Jay Berkenbilt
# License: Apache License 2.0: https://github.com/qpdf/qpdf/blob/master/LICENSE.txt
# Notes: 

{% if grains['oscodename'] == 'focal' %}

include:
  - remnux.repos.remnux

qpdf:
  pkg.installed

{% elif grains['oscodename'] == 'jammy' %}

qpdf:
  pkg.installed

{% endif %}
