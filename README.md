## ANXS - PostgreSQL [![Build Status](https://travis-ci.org/ANXS/postgresql.svg?branch=master)](https://travis-ci.org/ANXS/postgresql)

---
Help Wanted! If you are able and willing to help maintain this Ansible role then please open a GitHub issue. A lot of people seem to use this role and we (quite obviously) need assistance!
💖
---

Ansible role which installs and configures PostgreSQL, extensions, databases and users.


#### Installation

This has been tested on Ansible 2.4.0 and higher.

To install:

```
ansible-galaxy install ANXS.postgresql
```


#### Dependencies

- ANXS.monit ([Galaxy](https://galaxy.ansible.com/list#/roles/502)/[GH](https://github.com/ANXS/monit)) if you want monit protection (in that case, you should set `monit_protection: true`)


#### Compatibility matrix

| Distribution / PostgreSQL | <= 9.2 | 9.3 | 9.4 | 9.5 | 9.6 | 10 | 11 |
| ------------------------- |:------:|:---:|:---:|:---:|:---:|:--:|:--:|
| Ubuntu 14.04 | :no_entry: | :white_check_mark:| :white_check_mark:| :white_check_mark:| :white_check_mark:| :white_check_mark:| :grey_question:|
| Ubuntu 16.04 | :no_entry: | :white_check_mark:| :white_check_mark:| :white_check_mark:| :white_check_mark:| :white_check_mark:| :grey_question:|
| Debian 8.x | :no_entry: | :white_check_mark:| :white_check_mark:| :white_check_mark:| :white_check_mark:| :white_check_mark:| :grey_question:|
| Debian 9.x | :no_entry: | :white_check_mark:| :white_check_mark:| :white_check_mark:| :white_check_mark:| :white_check_mark:| :grey_question:|
| CentOS 6.x | :no_entry: | :white_check_mark:| :white_check_mark:| :white_check_mark:| :white_check_mark:| :white_check_mark:| :grey_question:|
| CentOS 7.x | :no_entry: | :white_check_mark:| :white_check_mark:| :white_check_mark:| :white_check_mark:| :white_check_mark:| :grey_question:|

- :white_check_mark: - tested, works fine
- :grey_question: - will work in the future (help out if you can)
- :interrobang: - maybe works, not tested
- :no_entry: - PostgreSQL has reached EOL


#### Variables

```yaml
# Basic settings
postgresql_version: 9.6
postgresql_encoding: "UTF-8"
postgresql_locale: "en_US.UTF-8"
postgresql_ctype: "en_US.UTF-8"

postgresql_admin_user: "postgres"
postgresql_default_auth_method: "trust"

postgresql_service_enabled: false # should the service be enabled, default is true

postgresql_cluster_name: "main"
postgresql_cluster_reset: false

# List of databases to be created (optional)
# Note: for more flexibility with extensions use the postgresql_database_extensions setting.
postgresql_databases:
  - name: foobar
    owner: baz          # optional; specify the owner of the database
    hstore: yes         # flag to install the hstore extension on this database (yes/no)
    uuid_ossp: yes      # flag to install the uuid-ossp extension on this database (yes/no)
    citext: yes         # flag to install the citext extension on this database (yes/no)
    encoding: "UTF-8"   # override global {{ postgresql_encoding }} variable per database
    lc_collate: "en_GB.UTF-8"   # override global {{ postgresql_locale }} variable per database
    lc_ctype: "en_GB.UTF-8"     # override global {{ postgresql_ctype }} variable per database

# List of database extensions to be created (optional)
postgresql_database_extensions:
  - db: foobar
    extensions:
      - hstore
      - citext

# List of users to be created (optional)
postgresql_users:
  - name: baz
    pass: pass
    encrypted: no       # denotes if the password is already encrypted.

# List of user privileges to be applied (optional)
postgresql_user_privileges:
  - name: baz                   # user name
    db: foobar                  # database
    priv: "ALL"                 # privilege string format: example: INSERT,UPDATE/table:SELECT/anothertable:ALL
    role_attr_flags: "CREATEDB" # role attribute flags
```

There's a lot more knobs and bolts to set, which you can find in the [defaults/main.yml](./defaults/main.yml)


#### Testing

This project comes with a Vagrantfile, this is a fast and easy way to test changes to the role, fire it up with `vagrant up`

See [vagrant docs](https://docs.vagrantup.com/v2/) for getting setup with vagrant

Once your VM is up, you can reprovision it using either `vagrant provision`, or `ansible-playbook tests/playbook.yml -i vagrant-inventory`

If you want to toy with the test play, see [tests/playbook.yml](./tests/playbook.yml), and change the variables in [tests/vars.yml](./tests/vars.yml)

If you are contributing, please first test your changes within the vagrant environment, (using the targeted distribution), and if possible, ensure your change is covered in the tests found in [.travis.yml](./.travis.yml)


#### License

Licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.


#### Thanks

Creator:
- [Pjan Vandaele](https://github.com/pjan)

Maintainers:
- [Jonathan Lozada D.](https://github.com/jlozadad)
- [Jonathan Freedman](https://github.com/otakup0pe)
- [Sergei Antipov](https://github.com/UnderGreen)

Top Contributors:
- [David Farrington](https://github.com/farridav)
- [Jesse Lang](https://github.com/jesselang)
- [Greg Clough](https://github.com/gclough)
- [Michael Conrad](https://github.com/MichaelConrad)
- [Sébastien Alix](https://github.com/sebalix)
- [Copperfield](https://github.com/Copperfield)

- [Ralph von der Heyden](https://github.com/ralph)


#### Feedback, bug-reports, requests, ...

Are [welcome](https://github.com/ANXS/postgresql/issues)!
