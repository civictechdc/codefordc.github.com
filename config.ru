$:.push("/Users/mattbailey/.rvm/gems/ruby-1.9.2-p320@php/gems/rack-1.4.1/lib/")
$:.push("/Users/mattbailey/.rvm/gems/ruby-1.9.2-p320@php/gems/rack-legacy-0.3.4/lib/")
$:.push("/Users/mattbailey/.rvm/gems/ruby-1.9.2-p320@php/gems/rack-rewrite-1.3.0/lib/")

#require "rubygems"
require "rack"
require "rack-legacy"
require "rack-rewrite"

INDEXES = ["index.html","index.php", "index.cgi"]

use Rack::Rewrite do
  rewrite %r{(.*/$)}, lambda {|match, rack_env|
    to_return = rack_env["PATH_INFO"]
    INDEXES.each do |index|
      if File.exists?(File.join(Dir.getwd, rack_env["PATH_INFO"], index))
        to_return = rack_env["PATH_INFO"] + index
      end
    end
    
    to_return
  }
end

use Rack::Legacy::Php, Dir.getwd
use Rack::Legacy::Cgi, Dir.getwd
run Rack::File.new Dir.getwd
require 'rack'
require 'rack-legacy'
require 'rack-rewrite'

INDEXES = ['index.html','index.php', 'index.cgi']

use Rack::Rewrite do
  rewrite %r{(.*/$)}, lambda {|match, rack_env|
    INDEXES.each do |index|
      if File.exists?(File.join(Dir.getwd, rack_env['PATH_INFO'], index))
        return rack_env['PATH_INFO'] + index
      end
    end
    rack_env['PATH_INFO']
  }
end

use Rack::Legacy::Php, Dir.getwd
use Rack::Legacy::Cgi, Dir.getwd
run Rack::File.new Dir.getwd
