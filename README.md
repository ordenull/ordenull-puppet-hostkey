ordenull-puppet-hostkey
=======================

## Overview

This module manages SSH host keys and the known_hosts file.

## Examples

Install the github host key in the global store /etc/ssh/ssh_known_hosts :

    hostkey { 'github.com': print => '16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48' }

Install the bitbucket host key for user root :

    hostkey { 'bitbucket.org': 
      path  => '/root/.ssh/known_hosts',
      print => '97:8c:1b:f2:6f:14:6b:5c:3b:ec:aa:46:46:74:7c:40',
    }

##Contributors

* Colin Percival : For the original ssh-knownhosts script

##Copyright and License

Copyright (C) 2013 [Stan Borbat](http://stan.borbat.com)

Stan Borbat can be contacted at: stan@borbat.com

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
