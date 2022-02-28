class Idea < ApplicationRecord
    mount_uploader :picture, PictureUploader 
    has_many :comments
    validates :name, presence: {message: 'deve ser preenchido'},
                     length: {maximum: 100, message: 'dever ter até 100 caracteres'}
    validates :description, presence: {message: 'deve ser preenchido'},
                          length: {maximum: 255, message: 'dever ter até 100 caracteres'}
end
