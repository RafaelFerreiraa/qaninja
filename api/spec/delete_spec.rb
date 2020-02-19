describe "DELETE" do

    context "when a registered user" do
        let(:user) { build(:registered_user) }
        let(:token) { ApiUser.token(user.email, user.password)}
        let(:resultado) { ApiUser.remove(token, user.id) }

        it { expect(resultado.response.code).to eql "204" }
    end

    context "when not exist" do
        let(:user) { build(:user) }
        let(:token) { ApiUser.token(user.email, user.password)}
        let(:resultado) { ApiUser.remove(token, user.id) }

        it { expect(resultado.response.code).to eql "404" }
    end

    context "when wrong id" do
        let(:user) { build(:registered_user) }
        let(:token) { ApiUser.token(user.email, user.password)}
        let(:resultado) { ApiUser.remove(token, "abc123") }

        it { expect(resultado.response.code).to eql "412" }
    end

end