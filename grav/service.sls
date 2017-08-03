# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "grav/map.jinja" import grav with context %}

include:
  - grav.install

grav-dir:
  file.directory:
    - name: {{ grav.directory }}

grav-container:
  dockerng.running:
    - name: {{ grav.name }}
    - image: {{ grav.image }}:{{ grav.branch }}
    - binds:
      - {{ grav.directory }}:/apps/var:rw
    - port_bindings:
      - {{ grav.port }}:8080
    {%- if grav['environment'] is defined %}
    - environment:
      {%- for env, value in grav.environment.items() %}
      - {{ env }}: {{ value|yaml_squote }}
      {%- endfor %}
    {%- endif %}
    - require:
      - dockerng: grav-image
