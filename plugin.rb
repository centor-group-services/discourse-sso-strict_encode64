# name: discourse-sso-strict_encode64
# about: forces strict base 64 encoding on the sso payload
# version: 0.0.1
# authors: Michael Holzheimer

after_initialize do
  class ::SingleSignOn
   def payload
     payload = Base64.strict_encode64(unsigned_payload)
     "sso=#{CGI::escape(payload)}&sig=#{sign(payload)}"
    end
  end
end
