# name: discourse-sso-fixer
# about: A super simple plugin to demonstrate how plugins work
# version: 0.0.1
# authors: Awesome Plugin Developer

after_initialize do
  class ::SingleSignOn
   def payload
     payload = Base64.strict_encode64(unsigned_payload)
     "sso=#{CGI::escape(payload)}&sig=#{sign(payload)}"
    end
  end
end
