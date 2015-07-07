# See https://github.com/voltrb/volt#routes for more info on routes

client '/', controller: 'main'
client '/examples', controller: 'examples', action: 'index'
client '/examples/{{ category }}/{{ example }}', controller: 'examples', action: 'example'

# Routes for login and signup, provided by user_templates component gem
#client '/signup', component: 'user_templates', controller: 'signup'
#client '/login', component: 'user_templates', controller: 'login'

# The main route, this should be last. It will match any params not
# previously matched.
client '/', {}
