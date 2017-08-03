# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "grav/map.jinja" import grav with context %}

grav-image:
  dockerng.image_present:
    - name: {{ grav.image }}:{{ grav.branch }}
    - force: True
