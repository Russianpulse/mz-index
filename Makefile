auth.js: public/assets/opal.js
	bundle exec opal --include plugin/ --no-opal -c plugin/auth.rb > public/assets/auth.js

public/assets/opal.js:
	bundle exec opal -c plugin/opal_asset.rb > public/assets/opal.js

