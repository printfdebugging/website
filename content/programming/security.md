---
title: data and system security
date: 2025-09-19
---

data at rest should be encrypted, i.e through disk encryption. data
which moves around should be encrypted either with a password or with
asymmetric keys. disable `sshd.service`, keep passwords super secret.
don't execute any script from the internet on your system. use a password
manager to generate and store passwords.

have multiple copies of the data, with multiple git hosting providers.
private repositories aren't private, never push plaintext secrets.
backup data at regular intervals on hard-drives, once an ssd is dead,
your data is lost forever. use open source software and get into a habbit 
of reading and auditing other's code.
