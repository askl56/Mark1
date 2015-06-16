require 'rails_helper'

RSpec.describe Bookmark, regressor: true do
  # === Relations ===
  it { is_expected.to belong_to :topic }
  it { is_expected.to belong_to :user }

  it { is_expected.to have_many :slugs }
  it { is_expected.to have_many :likes }
  it { is_expected.to have_many :users }

  # === Nested Attributes ===

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :url }
  it { is_expected.to have_db_column :topic_id }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :user_id }
  it { is_expected.to have_db_column :slug }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ['slug'] }
  it { is_expected.to have_db_index ['topic_id'] }

  # === Validations (Length) ===

  # === Validations (Presence) ===

  # === Validations (Numericality) ===

  # === Enums ===
end
