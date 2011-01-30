# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ecards_session',
  :secret      => '9f145ee08abac650c6bb5dd6a1ffccec1e1d46cbe1ad314d86d3e090dfdf7a635ab5dd82fc5fc47098a8ac5abc752c99fc4b2b03221b4e506aac81dc3560cf30'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
