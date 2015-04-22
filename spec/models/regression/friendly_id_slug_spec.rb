require 'rails_helper'

RSpec.describe FriendlyId::Slug, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :sluggable}
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
	it { is_expected.to have_db_column :slug }
	it { is_expected.to have_db_column :sluggable_id }
	it { is_expected.to have_db_column :sluggable_type }
	it { is_expected.to have_db_column :scope }
	it { is_expected.to have_db_column :created_at }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["sluggable_type"]}
	it { is_expected.to have_db_index ["slug", "sluggable_type", "scope"]}
	it { is_expected.to have_db_index ["slug", "sluggable_type"]}
	it { is_expected.to have_db_index ["sluggable_id"]}

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end