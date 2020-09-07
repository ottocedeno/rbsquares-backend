class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :balance, :winstreak
end
