policycoreutils:
  pkg.installed
policycoreutils-python:
  pkg.installed

selinux-config:
  file.sed:
    - name: /etc/selinux/config
    - before: (permissive|enforcing)$
    - after: disabled
    - limit: ^SELINUX=

disable-selinux:
  cmd.run:
    - name: /usr/sbin/setenforce 0
    - onlyif: test $(getenforce) = "enforcing"

firewalld:
  service:
    - dead
    - enable: false

