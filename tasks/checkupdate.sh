#!/bin/bash

PATH="/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin"

repoquery -q -a --qf="%{name}-%{version}-%{release}.%{arch}" --pkgnarrow=updates
