import os
import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')

postgresql_version = os.environ.get('POSTGRESQL_VERSION')

def test_directories(host):
    if host.system_info.distribution == "ubuntu":
        dirs = [
            "/etc/postgresql/{}/main".format(postgresql_version),
            "/var/run/postgresql"
        ]
    if host.system_info.distribution == "centos":
        dirs = [
            "/etc/postgresql/{}/data".format(postgresql_version),
            "/var/run/postgresql"
        ]
    for dir in dirs:
        d = host.file(dir)
        assert d.is_directory
        assert d.exists

def test_files(host):
    if host.system_info.distribution == "ubuntu":
        files = [
            "/etc/postgresql/{}/main/pg_hba.conf".format(postgresql_version),
            "/etc/postgresql/{}/main/pg_ident.conf".format(postgresql_version),
            "/var/run/postgresql/{}-main.pid".format(postgresql_version)
        ]
    if host.system_info.distribution == "centos":
        files = [
            "/etc/postgresql/{}/data/pg_hba.conf".format(postgresql_version),
            "/etc/postgresql/{}/data/pg_ident.conf".format(postgresql_version),
            "/var/run/postgresql/{}-data.pid".format(postgresql_version)
        ]

    for file in files:
        f = host.file(file)
        assert f.exists
        assert f.is_file

def test_service(host):
    if host.system_info.distribution == "ubuntu":
        s = host.service("postgresql")
    if host.system_info.distribution == "centos":
        s = host.service("postgresql-{}".format(postgresql_version))
    assert s.is_enabled
    assert s.is_running


def test_socket(host):
    sockets = [
        "tcp://127.0.0.1:5432"
    ]
    for socket in sockets:
        s = host.socket(socket)
        assert s.is_listening