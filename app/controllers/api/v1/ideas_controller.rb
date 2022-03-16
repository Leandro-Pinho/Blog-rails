module Api
	module V1
		class IdeasController < ApplicationController 
            protect_from_forgery with: :null_session
            
            # listar todas as ideas   
		    def index 
               ideas = Idea.all

               render json: {status: 'SUCCESS', message:'Ideas carregados', data:ideas},status: :ok
            end

            # listar a idea passando o ID
            def show 
                idea = Idea.find(params[:id])

                render json: {status: 'SUCCESS', message:'Loaded idea', data:idea},status: :ok
            end

            # Criar um novo artigo
			def create
                idea = Idea.new(idea_params)              
                
				if idea.save
					render json: {status: 'SUCCESS', message:'Saved idea', data:idea},status: :ok
				else
					render json: {status: 'ERROR', message:'Ideas not saved', data: idea.errors},status: :unprocessable_entity
				end
			end

            # Excluir idea
			def destroy
				idea = Idea.find(params[:id])
				idea.destroy
				render json: {status: 'SUCCESS', message:'Deleted idea', data:idea},status: :ok
			end

            # Atualizar um idea
			def update
				idea = Idea.find(params[:id])
				if idea.update(idea_params)
					render json: {status: 'SUCCESS', message:'Updated idea', data:idea},status: :ok
				else
					render json: {status: 'ERROR', message:'Ideas not update', data:idea.errors},status: :unprocessable_entity
				end
			end

			# Parametros aceitos
			private

			def idea_params
				params.require(:idea).permit(:name, :description)
			end
        end
	end
end
