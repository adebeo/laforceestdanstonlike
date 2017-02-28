class AddPseudoToSite < ActiveRecord::Migration[5.0]
  def change
    add_column :sites, :pseudo, :string
  end
end
