# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tasketeer_session',
  :secret      => 'a89637a5e35ce572f744f5ab02503dad31cd57e1a24e654680d081da00231ea0325bc393ab5d03fa44a45cbb1c573759d887a05c246647ac205e91e8a8d663d0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
