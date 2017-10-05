require 'native'
require 'cookies'
require 'pp'

class Auth
  attr_reader :cookies

  DOMAIN = 'local.mazavr.com:2300'

  def initialize
    @cookies = Cookies.new
    puts cookies.read(:t)
    cookies.write :t, 1234
  end

  def login
    options = {
      dataType: 'jsonp',
      crossDomain: true
    }
    req = `$.ajax('//'+#{DOMAIN}+'/me/api/token', #{options.to_n})`

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
