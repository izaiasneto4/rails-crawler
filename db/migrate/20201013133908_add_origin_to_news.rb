# frozen_string_literal: true

class AddOriginToNews < ActiveRecord::Migration[5.2]
  def change
    add_column :news, :origin, :string
  end
end
