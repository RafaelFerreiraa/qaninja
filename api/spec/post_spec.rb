
describe "post" do
    context "when new user" do
        before do
            @newUser = build(:user).to_hash
            @resultado = ApiUser.save(@newUser)
        end

        it { expect(@resultado.response.code).to eql "200" }
    end

    context "when wrong email" do
        before do
            @newUser = build(:user_wrong_email).to_hash
            @resultado = ApiUser.save(@newUser)
         end

        it { expect(@resultado.response.code).to eql "412" }
        it { expect(@resultado.parsed_response["msg"]).to eql "Oops. You entered a wrong email." }
    end

    context "when empty name" do
        before do
            @newUser = build(:empty_user).to_hash
            @resultado = ApiUser.save(@newUser)
         end

        it { expect(@resultado.response.code).to eql "412" }
        it { expect(@resultado.parsed_response["msg"]).to eql "Validation notEmpty on full_name failed" }

    end
end