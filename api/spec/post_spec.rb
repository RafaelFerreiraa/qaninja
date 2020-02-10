
describe "post" do
    context "when new user" do
        before do
            @newUser = build(:user).to_hash

            @resultado = HTTParty.post(
                "http://localhost:3001/user",
                body: @newUser.to_json,
                headers: {
                    "Content-Type" => "application/json"
                }
            )
        end
        puts @resultado
        it { expect(@resultado.response.code).to eql "200" }
    end
end