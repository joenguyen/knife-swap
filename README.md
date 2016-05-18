[![Build Status](https://travis-ci.org/joenguyen/knife-swap.svg?branch=master)](https://travis-ci.org/joenguyen/knife-swap) [![Coverage Status](https://coveralls.io/repos/github/joenguyen/knife-swap/badge.svg?branch=master)](https://coveralls.io/github/joenguyen/knife-swap?branch=master) [![Code Climate](https://codeclimate.com/github/joenguyen/knife-swap/badges/gpa.svg)](https://codeclimate.com/github/joenguyen/knife-swap)

# Knife Swap

Knife Swap was created to manage multiple knife configurations.  This functionality exists in [knife-block](https://github.com/knife-block/knife-block), which I am a huge fan of, but it doesn't seem to have Windows support because of the way it works under the hood.

Needing something that works in both Linux and Windows, I decided to create my own plugin.  This currently does _not_ swap the Berkshelf config files.  If there's a need for it, please feel free to open an issue.

## Installation

  `chef gem install knife-swap`

## Requirements

Knife Swap assumes your knife.rb files are set the way [knife-block](https://github.com/knife-block/knife-block) expects them to be with a small difference.

The knife configuration files would still be named knife-name.rb, but knife.rb is no longer a symlink.  So, they would be set up like this:

* knife.rb
* knife-name.rb
* knife-another.rb
* knife-soforth.rb

### Usage

| command | description |
|:---------------------|:-----------------------------------------|
| `knife swap` | List the current selected knife config as well as the available configurations.  For whatever reason you have multiple knife configurations that are exactly the same but just named differently, the console will show you that you've currently selected multiple configs.|
|`knife swap CONFIG`| Sets your current knife.rb to the desired config.|

### Authors

- [Joe Nguyen](https://github.com/joenguyen)

## License ##

|                      |                                          |
|:---------------------|:-----------------------------------------|
| **License:**         | Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
