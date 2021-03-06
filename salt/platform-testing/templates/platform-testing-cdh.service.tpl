[Unit]
Description=Platform testing cdh

[Service]
Type=oneshot
ExecStart={{ platform_testing_directory }}/{{platform_testing_package}}/venv/bin/python {{ platform_testing_directory }}/{{platform_testing_package}}/monitor.py --plugin cdh --postjson http://{{ console_hoststring }}/metrics --extra "--cmhost {{ cm_hoststring }} --cmport {{ cm_port }} --cmuser {{ cm_username }} --cmpassword {{ cm_password }}"
