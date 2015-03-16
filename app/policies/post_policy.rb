 class PostPolicy < ApplicationPolicy
   class Scope
        attr_reader :user, :scope 

        def initialize
        	@user = user
        	@scope = scope
        end
        
        def index?
            user.admin? || user.moderator?
        end

        def show?
            user.present?  && (record.user == user || user.admin?)

        end

   end
  
    def index?
      true
    end
 
 end