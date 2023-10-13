require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context 'with DB columns' do
    {
      email: :string,
      first_name: :string,
      last_name: :string,
      encrypted_password: :string
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end
end
