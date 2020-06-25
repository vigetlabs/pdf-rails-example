require 'dragonfly'
require 'dragonfly/s3_data_store'

Dragonfly.app.configure do
  plugin :imagemagick

  secret "..."
  url_format '/uploads/:job/:name'
  datastore :file,
  root_path:   Rails.root.join('public/uploads', Rails.env),
  server_root: Rails.root.join('public')

  define_url do |app, job, opts|
    # cropping = PhotoCropping.find_by(signature: job.signature)

    if job.process_steps.empty?
      # No processing to perform, link to the original
      app.datastore.url_for(job.uid)

    # elsif cropping
    #   # A cropping already exists, link to it
    #   app.datastore.url_for(cropping.uid)

    else
      # Link to the job
      app.server.url_for(job)
    end
  end


end
# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
