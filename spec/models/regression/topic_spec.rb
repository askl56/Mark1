require 'rails_helper'

RSpec.describe Topic, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :user}

  it { is_expected.to have_many :slugs}
	it { is_expected.to have_many :bookmarks}

  # === Nested Attributes ===


  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
	it { is_expected.to have_db_column :title }
	it { is_expected.to have_db_column :user_id }
	it { is_expected.to have_db_column :created_at }
	it { is_expected.to have_db_column :updated_at }
	it { is_expected.to have_db_column :slug }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["slug"]}
	it { is_expected.to have_db_index ["user_id"]}

  # === Validations (Length) ===
  it { is_expected.to allow_value(Faker::Lorem.characters(1)).for :title }
	it { is_expected.not_to allow_value(Faker::Lorem.characters(0)).for :title }

  # === Validations (Presence) ===


  # === Validations (Numericality) ===



  # === Enums ===


end
