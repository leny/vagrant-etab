# etab (for vagrant)

> Vagrant base box with node.js, mongodb and other stuffs.

* * *

**etab** is a *Vagrant base box* for node.js development.

> **Note:** this box is _absolutely not_ intended for production use !

* * *

## Box usage

Before starting, you need to add the box to your local vagrant box library with the following command :

    vagrant box add --name leny/etab http://vagrant.flatland.be/etab-2016-10-04.box

After that, go to your project and type :

    vagrant init leny/etab

You can customize your `Vagrantfile` as you wish, according to the config of the box components mentionned before.

* * *

## Box Content

### Base box

Ubuntu 14.04 LTS

> **Note:** the ubuntu/xenial64 vagrant base box had [strange bugs](https://bugs.launchpad.net/cloud-images/+bug/1569237) when used as base for packaging.

### Provider

Virtual box

### Components

#### Node.js

Installed version: `6.7.0`

##### Global packages

- gulp-cli `1.2.2`
- grunt-cli `1.2.0`
- node-inspector `0.12.8`
- supervisor `0.11.0`

#### MongoDB

Installed version: `3.2.10`  
Port **27017**, _without_ IP binding (listening from all interfaces).

#### Redis

Installed version: `3.2.4`  
Port **6379**, _without_ IP binding (listening from all interfaces).

#### Nginx

Installed version: **nginx-extras** `1.10.0`  
Listening on port 80.

##### Host configuration

Redirecting all traffic from port **80** to vagrant internal port **12345** (to use with node.js).

If the URL target a ressource with one of the following extensions, it will be redirected to path `/vagrant/static` : `[ jpg, jpeg, gif, png, ico, css, zip, tgz, gz, rar, bz2, pdf, txt, tar, wav, bmp, rtf, js, flv, swf, html, htm, svg, ttf, woff ]`.

The **track_uploads** extension is activated on the host and can be reported on `/upload/progress` URL.

#### Glances

Installed version: `3.4.2`

* * *

## Building

Commands to build & package the box from scratch.

    vagrant package --output etab-$(date +%F).box
