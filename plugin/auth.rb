require 'native'
require 'cookies'

class Auth
  attr_reader :cookies

  DOMAIN = 'local.mazavr.com:2300'

  def initialize
    @cookies = Cookies.new
  end

  def login
    req = `$.getJSON('//'+#{DOMAIN}+'/me/api/token')`

    Native(req).done do |d|
      data = Native(d)
      
      case data[:status]
      when :user
        save_cookies data[:token], data[:expires_in]
      else
        clear_cookies
      end
    end
  end

  private


  def save_cookies(token, expires_in)
    puts token
    puts expires_in
  end

  def clear_cookies
    puts "Go to https://#{DOMAIN}/me to login"
  end

  def token
    cookies['mz.token']
  end
end
