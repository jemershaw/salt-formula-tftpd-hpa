{%- from "tftpd_hpa/map.jinja" import server with context %}
{%- if server.enabled %}

tftpd_hpa_package:
  pkg.installed:
  - name: {{ server.pkgs.name }}

tftpd_hpa_service:
  service.running:
  - name: {{ server.service }}
  - enable: true
  - running: true

{%- endif %}
