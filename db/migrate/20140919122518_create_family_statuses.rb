class CreateFamilyStatuses < ActiveRecord::Migration
  def change
    create_table :family_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
