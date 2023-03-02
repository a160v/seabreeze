class AddNewFieldsToBoat < ActiveRecord::Migration[7.0]
  def change
    add_column :boats, :type, :string
    add_column :boats, :description, :text
    add_column :boats, :capacity, :integer
    add_column :boats, :address, :string
    add_column :boats, :picture, :string
    add_column :boats, :manufacturing_year, :integer
    add_column :boats, :with_crew, :boolean
    add_column :boats, :availability, :boolean
  end
end
