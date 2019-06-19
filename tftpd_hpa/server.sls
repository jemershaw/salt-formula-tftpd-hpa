{%- from "tftpd_hpa/map.jinja" import server with context %}
{%- if server.enabled %}

tftpd_hpa_package:
  pkg.installed:
  - name: {{ server.pkgs.name }}

tftpd_hpa_install:
  file.managed:
    - name: /opt/tftpd_hpa.xml
    - source: salt://tftpd_hpa/files/smartos.xml
    - mode: 644
    - user: root
    - group: root
  cmd.run:
    - name: svccfg import /opt/tftpd_hpa.xml
    - onchanges:
      - file: tftpd_hpa_install

tftpd_hpa_service:
  service.running:
  - name: {{ server.service }}
  - enable: true
  - running: true

{%- endif %}
