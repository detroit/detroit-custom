# Detroit Custom Tool

[Website](http://rubyworks.github.com/detroit-custom) /
[Report Issue](http://github.com/rubyworks/detroit-custom/issues) /
[Development](http://github.com/rubyworks/detroit-custom)

[![Build Status](https://secure.travis-ci.org/rubyworks/detroit-custom.png)](http://travis-ci.org/rubyworks/detroit-locat) 
[![Gem Version](https://badge.fury.io/rb/detroit-custom.png)](http://badge.fury.io/rb/detroit-custom) &nbsp; &nbsp;
[![Flattr Me](http://api.flattr.com/button/flattr-badge-large.png)](http://flattr.com/thing/324911/Rubyworks-Ruby-Development-Fund)


## About

The Custom tool provides the means for any procedure to run at any point
in a toolchain's assembly. 

To use, simply provide the procedure as Ruby code within an entry
corresponding to the assembly station under which it should run.

    hello:
      tool: custom
      document: |
        puts "Hello world!"


## Install

Per the usual gem install process:

    $ gem install detroit-custom

Or place `detroit-custom` in one's Gemfile.


## Legal

Detroit Custom

Copyright (c) 2014 Rubyworks

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

See LICENSE.txt for details.

