module SessionsHelper

	def sign_in(account)
		cookies.permanent[:remember_token] = account.remember_token
		self.current_user = account
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(account)
		@current_user = account
	end

	def current_user?(account)
		account == current_user
	end

	def signed_in_user
		unless signed_in?
			store_location
			redirect_to signin_url, notice: "Please sign in."
		end
	end

	def current_user
		@current_user ||= Account.find_by_remember_token(cookies[:remember_token])
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.url
	end

	def current_profile
		current_user.profile
	end

	def current_profile?(profile)
		profile == current_profile
	end

	def states
		['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'District of Columbia', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas',
			  'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York',
			  'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
	end

	def states_helper_for_best_in_place
		[[1, 'Alabama'],[2,'Alaska'], [3,'Arizona'], [4, 'Arkansas'], [5,'California'], [6, 'Colorado'], [7,'Connecticut'], [8,'Delaware'], [9,'District of Columbia'], [10,'Florida'], [11,'Georgia'], [12,'Hawaii'], [13,'Idaho'], [14,'Illinois'], [15,'Indiana'], [16,'Iowa'], [17,'Kansas'], [18,'Kentucky'], [19,'Louisiana'], [20,'Maine'], [21,'Maryland'], [22,'Massachusetts'], [23,'Michigan'], [24,'Minnesota'], [25,'Mississippi'], [26,'Missouri'], [27,'Montana'], [28,'Nebraska'], [29,'Nevada'], [30,'New Hampshire'], [31,'New Jersey'], [32,'New Mexico'], [33,'New York'], [34,'North Carolina'], [35,'North Dakota'], [36,'Ohio'], [37,'Oklahoma'], [38,'Oregon'], [39,'Pennsylvania'], [40,'Rhode Island'], [41,'South Carolina'], [42,'Tennessee'], [43,'Texas'], [44,'Utah'], [45,'Vermont'], [46,'Virginia'], [47,'Washington'], [48,'West Virginia'], [49,'Wisconsin'], [50,'Wyoming']]
	end
end
