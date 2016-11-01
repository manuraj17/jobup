class AddOwnerToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :owner, :string
  end
end
