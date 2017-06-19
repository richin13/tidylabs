# Tydilabs

[![Build Status](https://travis-ci.org/richin13/tydilabs.svg?branch=dev)](https://travis-ci.org/richin13/tydilabs)

Tydilabs is an asset manager for the OCP office at the UCR Paraiso campus. It's used actively by the OCP manager and collaborators.

![showcase](http://i.imgur.com/zjbQhD2.png)

## Features
* Asset management by areas
* Keep track of a wide range of information
  * Photos
  * Categories
  * Warranties
  * Technical specs
  * Locations (areas)
  * Much more...
* Loans and revisions control
* Identification with QR codes
  * Print QR codes
  * Scan QR codes with the android companion app
* Multiple user roles
  * Admins
  * Collaborators
  
## Installation
Tydilabs is a standard Rails 5 app, so installation is simple:

**1. Install all the gems and front-end packages**
```
$ bundle install
$ bundle exec rake bower:install
```
**Note:** Make sure that your system have imagemagick installed

Mac
```
$ brew install imagemagick
```
Ubuntu / Debian
```
$ sudo apt install imagemagick -y
```
Or search in your package manager.

**2. Set up the database**
```
$ rails db:create
$ rails db:migrate
$ rails db:seed // Optional
```
Run the server
```
$ rails s
```
And you are good to go!

## Tests
Simply run
```
$ rails test
```
## Authors
[Ricardo Madriz C](https://github.com/richin13) & [Daniel Aguilar S](https://github.com/dascr32)

## License
See [LICENSE](https://github.com/richin13/tydilabs/blob/master/LICENSE)
