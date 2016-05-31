require 'bundler/setup'
require 'haml'
require 'sinatra'

class RackReflector < Sinatra::Base

  get '/*' do
    haml :env
  end
  post '/*' do
    haml :env
  end
  delete '/*' do
    haml :env
  end
  patch '/*' do
    haml :env
  end
  put '/*' do
    haml :env
  end
  options '/*' do
    haml :env
  end
  link '/*' do
    haml :env
  end
  unlink '/*' do
    haml :env
  end

private ######################################################################

  def cycle(zero, one)
    @cyclotron ||= 1
    @cyclotron   = 1 - @cyclotron
    @cyclotron  == 0 ? zero : one
  end

end

run RackReflector.new
