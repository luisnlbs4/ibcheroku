class AddImagepathToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :image_path, :string
  end
end
