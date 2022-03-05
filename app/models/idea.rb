class Idea < ApplicationRecord
    mount_uploader :picture, PictureUploader        # incluir imagem
    has_many :comments, dependent: :destroy        # incluir comentario

    # validação nome e descrição
    validates :name, presence: {message: 'deve ser preenchido'},
                     length: {maximum: 100, message: 'dever ter até 100 caracteres'}
    validates :description, presence: {message: 'deve ser preenchido'},
                          length: {maximum: 1255, message: 'dever ter até 1200 caracteres'}
end

