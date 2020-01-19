class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user
end
