# frozen_string_literal: true

class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :url
      t.string :title
      t.string :subtitle
      t.datetime :publishing_date
      t.datetime :crawl_date
      t.text :news_body
      t.string :tags

      t.timestamps
    end
  end
end
