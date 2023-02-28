class UpdateForeignKeys < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :post_categories, :categories
    remove_foreign_key :post_categories, :posts

    remove_foreign_key :post_tags, :posts
    remove_foreign_key :post_tags, :tags

    add_foreign_key "post_categories", "categories", on_delete: :cascade
    add_foreign_key "post_categories", "posts", on_delete: :cascade

    add_foreign_key "post_tags", "posts", on_delete: :cascade
    add_foreign_key "post_tags", "tags", on_delete: :cascade
  end
end
