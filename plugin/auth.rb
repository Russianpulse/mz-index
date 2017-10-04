require 'native'
require 'cookies'

class Auth
  attr_reader :cookies

  def initialize
    @cookies = Browser::Cookies.new `document`
  end

  def login
    puts :login
    req = `$.getJSON("http://local.mazavr.com:2300/me/api/token")`

    Native(req).done do |data|
      case data[:status]
      when :user
        save_cookies data[:token]
      else
        clear_cookies
      end
    end
  end

  private

  def save_cookies
  end

  def clear_cookies
  end

  def token
    cookies['mz.token']
  end
end
