require 'rails_helper'

RSpec.describe Activity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context 'activity' do
    it { is_expected.to validate_presence_of :activity_name }
    it { is_expected.to validate_presence_of :address }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :equipment }
  end
end
