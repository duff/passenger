class WelcomeController < ApplicationController
	caches_page :cached
	
	def parameters_test
		headers["Content-Type"] = "text/plain"
		render :text => params.to_xml
	end
	
	def headers_test
		headers["X-Foo"] = "Bar"
		render :nothing => true
	end
	
	def touch
		File.unlink('public/touch.txt') rescue nil
		File.open('public/touch.txt', 'w') do end
		render :nothing => true
	end
	
	def in_passenger
		render :text => !!defined?(IN_PHUSION_PASSENGER)
	end
	
	def rails_env
		render :text => RAILS_ENV
	end
	
	def backtrace
		render :text => caller.join("\n")
	end
	
	def passenger_name
		render :text => Passenger.new.name
	end
	
	def terminate
		exit!
	end

	def show_id
		render :text => params[:id]
	end

	def request_uri
		render :text => request.request_uri
	end
end
