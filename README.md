# ![HAProxy](haproxy-weblogo-210x49.png "HAProxy")

## HAProxy Data Plane API

[![Contributors](https://img.shields.io/github/contributors/haproxytech/dataplaneapi?color=purple)](CONTRIBUTING.md)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

**Data Plane API** is a sidecar process that runs next to HAProxy and provides API endpoints for managing HAProxy. It requires HAProxy version 1.9.0 or higher.

## Building the Data Plane API

In order to build the Data Plane API you need Go installed on your system with go modules support enabled, and execute the following steps:

1\. Clone dataplaneapi repository

```
git clone https://github.com/tbdavid94/haproxy-api.git
```

2\. Run make build:

```
./build
```
