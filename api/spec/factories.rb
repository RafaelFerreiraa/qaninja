require_relative "models/user_model"

FactoryBot.define do

    factory :user, class: UserModel do
        full_name { "Rafael Ferreira" }
        email { "sf.rafael20@gmail.com" }
        password { "teste652" }
    end

    after(:build) do |user|
        Database.new.deleteUser(user.email)
    end
end