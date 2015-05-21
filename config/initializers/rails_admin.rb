RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  
  config.model 'Measurement' do
    exclude_fields :id, :measurement_block_id, :updated_at
  end
  
  config.model 'User' do 
    exclude_fields :reset_password_token,
	           :reset_password_sent_at,
		   :current_sign_in_at,
		   :last_sign_in_at,
		   :current_sign_in_ip,
		   :last_sign_in_ip
				   
  end

  # prevent from going to /admin unless user is admin
  config.authorize_with do
    redirect_to main_app.root_path unless warden.user.admin?
  end

end
