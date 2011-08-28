source 'http://rubygems.org'

gem 'rails', '3.0.9'

gem 'mysql'
gem 'mysql2', '~> 0.2.7'
gem 'jquery-rails', '>= 0.2.6'
gem 'authlogic'
gem 'declarative_authorization'
# gem 'will_paginate', :git => 'git://github.com/mislav/will_paginate.git', :branch => 'rails3'
gem 'capistrano'

# HAD TROUBLE WITH THIS... Do the following to get it right:
# 	MAC: 	Use https://github.com/maddox/magick-installer OR
#			Follow the official instructions: http://rmagick.rubyforge.org/install-osx.html
# 	LINUX: 	
#			yum install tcl-devel libpng-devel libjpeg-devel ghostscript-devel bzip2-devel freetype-devel libtiff-devel
#			wget ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick.tar.gz
#			tar zxvpf ImageMagick.tar.gz
#			cd ImageMagick-6.6.9-9
#			./configure --prefix=/usr/local --with-bzlib=yes --with-fontconfig=yes --with-freetype=yes --with-gslib=yes --with-gvc=yes --with-jpeg=yes --with-jp2=yes --with-png=yes --with-tiff=yes
#			make clean
#			make
#			make install
gem 'rmagick'
gem 'carrierwave'
gem 'exception_notification'

group :development, :test do
	gem 'rspec-rails'
	gem 'capybara'
	gem 'database_cleaner'
	gem 'cucumber-rails'
	# http://www.rubyinside.com/how-to-rails-3-and-rspec-2-4336.html
	gem 'spork', '>=0.9.0.rc2'
	gem 'launchy'
	gem 'watchr'
	
	# rails generate jquery:install
	# sudo install_name_tool -change libmysqlclient.16.dylib /usr/local/mysql/lib/libmysqlclient.16.dylib /Users/ejangi/.rvm/gems/ruby-1.8.7-p334/gems/mysql2-0.2.11/lib/mysql2/mysql2.bundle
end