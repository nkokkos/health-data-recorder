module Constraint
  #https://www.codementor.io/tips/8132473431/use-custom-routing-constraints-to-limit-access-to-rails-routes-via-warden  
  class Admin
 
    def matches?(request)
      warden(request).user.admin?
    end
 
    private
 
    def warden(request)
      request.env['warden']
    end
  
  end
  
end
