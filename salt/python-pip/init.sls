{% set pip_index_url = pillar['pip']['index_url'] %}

python-pip-install_python_pip_pkg:
  pkg.installed:
    - name: {{ pillar['python-pip']['package-name'] }}
    - version: {{ pillar['python-pip']['version'] }}
    - ignore_epoch: True

python-pip-install_python_dev_pkg:
  pkg.installed:
    - name: {{ pillar['python-dev']['package-name'] }}
    - version : {{ pillar['python-dev']['version'] }}
    - ignore_epoch: True

#Added by Benny as recommanded from here : https://github.com/saltstack/salt/issues/38916 - START
pip_upgrade:
  cmd.run:
    - name: pip install --ignore-installed --upgrade 'pip==9.0.1'
    - unless: pip -V | grep '9.0.1'
    #- require:
    #  - pkg: python-pip
    - reload_modules: True
#END

python-pip-install_python_pip:
  pip.installed:
    - pkgs:
      - pip == 9.0.1
      - virtualenv == 15.1.0
    - upgrade: True
    - reload_modules: True
    - index_url: {{ pip_index_url }}
    - require:
      - pkg: python-pip-install_python_pip_pkg
      - pkg: python-pip-install_python_dev_pkg
