## Ansibles - PostgreSQL [![Build Status](https://travis-ci.org/Ansibles/postgresql.png)](https://travis-ci.org/Ansibles/postgresql)

Ansible role for installing and configuring PostgreSQL.


#### Requirements & Dependencies
- Tested on Ansible 1.4 or higher.
- Ansibles.monit if you want monit protection (in that case, you should set `monit_protection: true`)


#### Variables

```yaml
# Basic settings
postgresql_version: 9.3
postgresql_encoding: 'UTF-8'
postgresql_locale: 'en_US.UTF-8'

postgresql_admin_user: "postgres"
postgresql_default_auth_method: "trust"

postgresql_cluster_name: "main"
postgresql_cluster_reset: false
```

There's a lot more knobs and bolts to set, which you can find in the defaults/main.yml

#### License

Licensed under the MIT License. See the LICENSE file for details.

#### Feedback, bug-reports, requests, ...

Are [welcome](https://github.com/ansibles/postgresql/issues)!
