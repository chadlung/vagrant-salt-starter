Vagrant Salt Starter
====================

These scripts will quickly allow you to setup a simple Salt Master and Minion
using Vagrant. To get started simply:

```
$ git clone https://github.com/chadlung/vagrant-salt-starter.git
$ cd vagrant-salt-starter
$ vagrant up
```

**Note:** Be aware you are running the [Salt Bootstrap](https://github.com/saltstack/salt-bootstrap)
script from the Internet, make sure you 
[examine and trust the source](https://github.com/saltstack/salt-bootstrap) before running.

The `saltmaster` will have IP `192.168.37.10` and `minion01` will have IP
`192.168.37.11`

Once the VMs are both ready go ahead an run the following to verify:

**minion01**

```
$ vagrant ssh minion01
```

Inside the `minion01` VM run:

```
$ sudo cat /var/log/salt/minion
$ sudo tail /var/log/salt/minion
```

You should see output like this:

```
2015-01-21 04:23:51,857 [salt.crypt       ][ERROR   ] The Salt Master has cached the public key for this node, this salt minion will wait for 10 seconds before attempting to re-authenticate
2015-01-21 04:24:01,871 [salt.crypt       ][ERROR   ] The Salt Master has cached the public key for this node, this salt minion will wait for 10 seconds before attempting to re-authenticate
2015-01-21 04:24:11,885 [salt.crypt       ][ERROR   ] The Salt Master has cached the public key for this node, this salt minion will wait for 10 seconds before attempting to re-authenticate
2015-01-21 04:24:21,899 [salt.crypt       ][ERROR   ] The Salt Master has cached the public key for this node, this salt minion will wait for 10 seconds before attempting to re-authenticate
2015-01-21 04:24:31,915 [salt.crypt       ][ERROR   ] The Salt Master has cached the public key for this node, this salt minion will wait for 10 seconds before attempting to re-authenticate
2015-01-21 04:24:41,922 [salt.crypt       ][ERROR   ] The Salt Master has cached the public key for this node, this salt minion will wait for 10 seconds before attempting to re-authenticate
2015-01-21 04:24:51,937 [salt.crypt       ][ERROR   ] The Salt Master has cached the public key for this node, this salt minion will wait for 10 seconds before attempting to re-authenticate
2015-01-21 04:25:01,951 [salt.crypt       ][ERROR   ] The Salt Master has cached the public key for this node, this salt minion will wait for 10 seconds before attempting to re-authenticate
2015-01-21 04:25:11,965 [salt.crypt       ][ERROR   ] The Salt Master has cached the public key for this node, this salt minion will wait for 10 seconds before attempting to re-authenticate
2015-01-21 04:25:21,980 [salt.crypt       ][ERROR   ] The Salt Master has cached the public key for this node, this salt minion will wait for 10 seconds before attempting to re-authenticate
```

Log out of `minion01` and log into the `saltmaster`:

**saltmaster**

```
$ vagrant ssh saltmaster
```

Inside the `saltmaster` VM run:

```
$ sudo salt-key -L
```

You should see output like this:

```
Accepted Keys:
Unaccepted Keys:
minion01
Rejected Keys:
```

Accept the `minion01` key:

```
$ sudo salt-key -y -a minion01
```

The output will be:

```
The following keys are going to be accepted:
Unaccepted Keys:
minion01
Key for minion minion01 accepted.
```

Your now good to go!

**saltmaster**

```
$ sudo salt minion01 test.ping
```

The output will be:

```
minion01:
    True
```
