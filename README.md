# Redis Vagrant box

This is a build for a [Vagrant](https://www.vagrantup.com/) box whose base is [Ubuntu Server 14.04 LTS](https://atlas.hashicorp.com/ubuntu/boxes/trusty64) with just an install of [Redis](http://redis.io/). Intended use is when Redis is required but you do not wish to install it locally. Instead you can grab this build and create a Vagrant instance instead.

## Requirements

You will need to have installed [VirtualBox](https://www.virtualbox.org/) and Vagrant before proceeding.

## Installation

Clone the repository, copying the project into a working directory

```bash
git clone https://github.com/Cruikshanks/redis-box.git && cd redis-box
```

To create the vagrant box, provision it and start the Redis services simply run

```bash
vagrant up
```

This will take a while the first time it runs, as it needs to build the virtual machine from scratch. Once done it will then start it up in the background.

### Host port

By default port 6379 will be bound from the host to the guest to enable access to MongoDB from the host. If you wish to change this set an environment variable (`REDISBOX_HOST_PORT`) to the port you wish to use. The easiest way to do this is when calling `vagrant up` itself.

```bash
REDISBOX_HOST_PORT=6380 vagrant up
```

### Caching

If you intend to use Vagrant and have a number of different boxes, install the Vagrant plugin [vagrant-cachier](http://fgrehm.viewdocs.io/vagrant-cachier/). This project takes advantage of it, speeding up future builds of new Vagrant boxes.

## License

This is released under the [MIT license](https://opensource.org/licenses/MIT).

> If you don't add a license it's neither free or open!
