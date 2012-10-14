# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Selfstarter::Application.initialize!

# Stripe stuffies
STRIPE_CLIENT_ID = 'ca_0XkgAi8RhMInruJ8ctSuyFIp3myXfG6U'
STRIPE_SECRET_API_KEY = 'sk_test_Ew1OBL4sHHRwezQAvlceXrDW'
