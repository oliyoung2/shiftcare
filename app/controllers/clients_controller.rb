class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = current_user.clients.order(created_at: :desc)
  end

  def create
    @client = Client.new(client_params.merge(created_by: current_user))
    if @client.save
      redirect_to client_path(@client), notice: t("client.created")
    end
  end

  def update
    if @client.update(client_params)
      redirect_to client_path(@client), notice: t("client.updated")
    end
  end

  def destroy
    @client.discard
    redirect_to clients_path, notice: t("client.discarded")
  end

  private

  def set_client
    @client = current_user.created_clients.order(client_at: :desc).find_by(id: params[:id])
  end

  def client_params
    params.require(:client).permit(:client_at, :address, :client_id, :notes)
  end
end
