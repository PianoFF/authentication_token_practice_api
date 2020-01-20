class User < ApplicationRecord
    has_secure_password
    has_many :posts

def token
    JWT.encode({user_id: self.id}, ENV['RAILS_SECRET'])
end 

end
