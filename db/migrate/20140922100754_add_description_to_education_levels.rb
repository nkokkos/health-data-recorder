class AddDescriptionToEducationLevels < ActiveRecord::Migration
  def change
    add_column :education_levels, :description, :string
  end
end
