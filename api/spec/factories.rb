require_relative "models/user_model"

FactoryBot.define do

    factory :user, class: UserModel do
        full_name { "Rafael Ferreira" }
        email { "sf.rafael20@gmail.com" }
        password { "teste652" }

        after(:build) do |user|
            Database.new.deleteUser(user.email)
        end
    end

    factory :user_wrong_email, class: UserModel do
        full_name { "Rafael Ferreira" }
        email { "sf.rafael20#gmail.com" }
        password { "teste652" }
    end

    factory :empty_user, class: UserModel do
        full_name { "" }
        email { "sf.rafael20#gmail.com" }
        password { "teste652" }
    end
end