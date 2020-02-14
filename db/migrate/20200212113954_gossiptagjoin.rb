class Gossiptagjoin < ActiveRecord::Migration[5.2]
  def change
    create_table :gossiptagjoins, id: false do |t|
      t.belongs_to :gossips
      t.belongs_to :tags
      t.timestamps
    end
  end
end
