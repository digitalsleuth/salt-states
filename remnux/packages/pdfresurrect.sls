# Name: pdfresurrect
# Website: https://github.com/enferex/pdfresurrect
# Description: Extract previous versions of content from PDF files.
# Category: Analyze Documents: PDF
# Author: Matt Davis
# License: GNU General Public License (GPL) v3: https://github.com/enferex/pdfresurrect/blob/master/LICENSE
# Notes: 

{% if grains['oscodename'] == 'focal' %}
include:
  - remnux.repos.remnux

{% endif %}

pdfresurrect:
  pkg.installed
