require 'rails_helper'

RSpec.describe Building, type: :model do
  describe ".rooms_number" do
    let!(:building_1_rooms) { create(:building, rooms: 1) }
    let!(:building_2_rooms) { create(:building, rooms: 2) }
    let!(:building_3_rooms) { create(:building, rooms: 3) }
    let!(:building_4_rooms) { create(:building, rooms: 4) }
    let!(:building_5_rooms) { create(:building, rooms: 5) }
    let!(:building_unknown_rooms) { create(:building, rooms: nil) }

    let(:scope) { Building.with_approximately_rooms(3) }

    it "returns only building with +- 1 room or without rooms" do
      expect(scope).to match_array [
                         building_2_rooms,
                         building_3_rooms,
                         building_4_rooms,
                         building_unknown_rooms
                       ]
    end
  end
end
