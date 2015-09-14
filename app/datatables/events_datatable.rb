class EventsDatatable 
  delegate :params, :i, :content_tag, :fa_icon, :link_to, :event_path, :current_user, to: :@view 

  def initialize(view) 
    @view = view 
  end 

  def as_json(options = {}) 
    { 
      data: data
    } 
  end 
 
=begin
  def data 
    events = [] 
    display_on_page.map do |record| 
      product = [] 
      product << record.id 
      product << record.code 
      product << record.name 
      product << record.description 
      product << link_to(fa_icon('trash-o lg'), products_path(record), method: :delete, data: { confirm: 'Are you sure?' }, class: 'label alert round') 
      products << product 
    end 
    products 
  end 

    create_table "events", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "patient_id",       limit: 4
    t.text     "message",          limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "trigger_block_id", limit: 4
  end
=end
  
 
  private

  def data
    events_data  = []
    events.map do |record|
	    event = []
	    event << record.created_at
        event << User.find(record.patient_id).name
        event << record.message
		#link_to "Delete", event_path(:id => record.id), method: :delete, class: "btn btn-danger btn-sm"
		#link_to content_tag(:i, "", class: "icon-trash icon-white"), event_path(:id => record.id), method: :delete, class: "btn btn-danger btn-sm"
        #event << link_to("Delete", event_path(record.id), method: :delete, data: { confirm: 'Are you sure?' }, :class => "label alert round" ) 
        #event << link_to ("TEXT" + content_tag(:i, class: "icon-trash icon-white")).html_safe, event_path(:id => record.id), method: :delete, class: "btn btn-danger btn-sm"
		event << link_to(fa_icon('fa-trash-o fa-lg'), event_path(record.id), method: :delete, data: { confirm: 'Are you sure you want to delete this?' }, class: 'btn btn-danger') 
        events_data << event
	end
	events_data
  end

=begin
<%= link_to("/url") do %>
  <%= content_tag(:div, class: "btn", id: "continue") do %>
    <%= image_tag('img_blank.png', alt: "Continue") %>
  <% end %>
<% end %>
=end

  
  
  def events   
    @events = Event.all.where("user_id=?", current_user.id)
  end

  def fetch_events
   # events = Event.order("#{sort_column} #{sort_direction}")
   # products = products.page(page).per_page(per_page)
   # if params[:sSearch].present?
   #   products = products.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
   # end
   # products
  #end
  end
  

end
  

  
  
  
  
  