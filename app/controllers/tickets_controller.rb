class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy download]

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
    @project =  Project.find(params[:project_id]).id
    @filename = ''

  end

  # GET /tickets/1 or /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @project =  Project.find(params[:project_id])
  end

  # GET /tickets/1/edit
  def edit
    @project =  Project.find(params[:project_id])

  end

  # POST /tickets or /tickets.json
  def create
    @project =  Project.find(params[:project_id])
    @ticket = @project.tickets.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        DueDateJob.set(wait_until: 1.second.since(@ticket.due_date)).perform_later(@ticket)
        DueDateJob.set(wait: 1.second).perform_later(@ticket)
        format.html { redirect_to project_url(@project), notice: "Ticket was successfully created." }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    @project =  Project.find(params[:project_id])
    @ticket.update(ticket_params)
    puts "================================================="
    puts params
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to project_ticket_url(@project,@ticket), notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # def download
  #   send_data @ticket.attachment.read,filename: @ticket.name
  # end
  #Ex:- :default =>''
  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy
    @project =  Project.find(params[:project_id])

    respond_to do |format|
      format.html { redirect_to project_url(@project), notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:title, :description, :status, :projects_id,:due_date,:attachment=>[])
    end
end
