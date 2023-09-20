class User < ApplicationRecord
  has_secure_password

  enum roles: {user: 0, admin: 1}

end
