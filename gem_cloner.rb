# Author: Drew Blas
# Contact: gem_cloner@isotopetech.com
# Creation date: 30 December, 2008
# Modified date: 30 December, 2008
# Version: 1.0
#
# The MIT License
# Copyright (c) <year> <copyright holders>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


puts "Cloning gem list from gems.txt"
File.open('gems.txt','r') do |f|
  f.each_line do |l|
    match = l.match /(.*)\s\((.*)\)/ #Retrieve the gem name and version
    if match #Ignore non-matching lines
      gem_name = match[1]
      versions = match[2].gsub(' ','').split(',')
      for version in versions
        puts "Installing #{gem_name} - #{version}"
        `gem install #{gem_name} -v #{version}`
      end
    end
  end
end
puts "Finished clone"