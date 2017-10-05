%x{
!function(e){var n=!1;if("function"==typeof define&&define.amd&&(define(e),n=!0),"object"==typeof exports&&(module.exports=e(),n=!0),!n){var o=window.Cookies,t=window.Cookies=e();t.noConflict=function(){return window.Cookies=o,t}}}(function(){function e(){for(var e=0,n={};e<arguments.length;e++){var o=arguments[e];for(var t in o)n[t]=o[t]}return n}function n(o){function t(n,r,i){var c;if("undefined"!=typeof document){if(arguments.length>1){if(i=e({path:"/"},t.defaults,i),"number"==typeof i.expires){var a=new Date;a.setMilliseconds(a.getMilliseconds()+864e5*i.expires),i.expires=a}i.expires=i.expires?i.expires.toUTCString():"";try{c=JSON.stringify(r),/^[\{\[]/.test(c)&&(r=c)}catch(e){}r=o.write?o.write(r,n):encodeURIComponent(String(r)).replace(/%(23|24|26|2B|3A|3C|3E|3D|2F|3F|40|5B|5D|5E|60|7B|7D|7C)/g,decodeURIComponent),n=encodeURIComponent(String(n)),n=n.replace(/%(23|24|26|2B|5E|60|7C)/g,decodeURIComponent),n=n.replace(/[\(\)]/g,escape);var f="";for(var s in i)i[s]&&(f+="; "+s,i[s]!==!0&&(f+="="+i[s]));return document.cookie=n+"="+r+f}n||(c={});for(var p=document.cookie?document.cookie.split("; "):[],d=0;d<p.length;d++){var u=p[d].split("="),l=u.slice(1).join("=");'"'===l.charAt(0)&&(l=l.slice(1,-1));try{var g=u[0].replace(/(%[0-9A-Z]{2})+/g,decodeURIComponent);if(l=o.read?o.read(l,g):o(l,g)||l.replace(/(%[0-9A-Z]{2})+/g,decodeURIComponent),this.json)try{l=JSON.parse(l)}catch(e){}if(n===g){c=l;break}n||(c[g]=l)}catch(e){}}return c}}return t.set=t,t.get=function(e){return t.call(t,e)},t.getJSON=function(){return t.apply({json:!0},[].slice.call(arguments))},t.defaults={},t.remove=function(n,o){t(n,"",e(o,{expires:-1}))},t.withConverter=n,t}return n(function(){})});
//# sourceMappingURL=js.cookie.min.js.map
}

#   cookies = Browser::Cookies.new(`document`)
#   cookies["my-cookie"] = "monster"
#   cookies.delete("my-cookie")
#
class Cookies
  # Default cookie options.
  DEFAULT = {
    expires: Time.now + 60 * 60 * 24,
    secure:  false
  }

  attr_reader :options

  def initialize
    @options  = DEFAULT.dup
  end

  # Access the cookie with the given name.
  #
  # @param name [String] the name of the cookie
  #
  # @return [Object]
  def read(name)
    Native(`Cookies.get(name)`)
  end

  # Set a cookie.
  #
  # @param name [String] the name of the cookie
  # @param value [Object] the data to set
  # @param options [Hash] the options for the cookie
  #
  # @option options [Integer] :max_age the max age of the cookie in seconds
  # @option options [Time]    :expires the expire date
  # @option options [String]  :path    the path the cookie is valid on
  # @option options [String]  :domain  the domain the cookie is valid on
  # @option options [Boolean] :secure  whether the cookie is secure or not
  def write(name, value, opts = {})
    opts = options.merge(opts)
    pp opts
    `console.log(opts)`
    `Cookies.set(name, value, opts)`
  end

  # Delete a cookie.
  #
  # @param name [String] the name of the cookie
  def delete(name)
  end

  # @!attribute [r] keys
  # @return [Array<String>] all the cookie names
  def keys
    Array(`document.cookie.split(/; /)`).map {|cookie|
      cookie.split(/\s*=\s*/).first
    }
  end

  # @!attribute [r] values
  # @return [Array] all the cookie values
  def values
    keys.map {|key|
      self[key]
    }
  end
end
