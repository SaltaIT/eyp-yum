# CHANGELOG

## 0.1.23

* added customizable verbose for createrepo
* repomd.xml validation

## 0.1.22

* added createrepo to reposync script

## 0.1.20

* added PATH to reposync script
* added notifempty to logrotation

## 0.1.19

* improved debugging

## 0.1.18

* added configurable max iterations waiting for **yum.pid**
* added mkdir repo_path and cd repo_path in script reposync

## 0.1.17

* added quiet option enabled by default in **yum::reposync**
* added logrotation using **eyp-logrotate**

## 0.1.16

* improved **yum::reposync** logging

## 0.1.15

* **yum::reposync**: yum.pid locking

## 0.1.14

* reposync script lint
* added logdir for reposync

## 0.1.13

* added log file for reposyncs
* added rposync options:
  * delete
  * newest_only

## 0.1.12

* added generic exec path

## 0.1.11

* reposync with a bash script to add some sanity checks

## 0.1.10

* bugfix: allow multiples reposyncs using the same repo_path
* added the following variables to **yum**:
  * gpgcheck
  * obsoletes
  * plugins

## 0.1.9

* added exclude option for yum.conf

## 0.1.8

* bugfix Package['createrepo']

## 0.1.7

* check if proxy is empty

## 0.1.6

* bugfix reposync cronjob name

## 0.1.5

* bugfix mkdir -p reposync

## 0.1.4

* added directory **repo_path** under management (**yum::reposync**)

## 0.1.3

* added **yum::reposync** according to [How to create a local mirror of the latest update for Red Hat Enterprise Linux 5, 6, 7 without using Satellite server](https://access.redhat.com/solutions/23016)

## 0.1.2

* centos/rhel 7 support
