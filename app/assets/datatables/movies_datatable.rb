class MoviesDatatable < ApplicationDatatable
	private

	def data
		movies.map do |movie|
			[].tap do |column|
				column << movie.title
				column << movie.category
				column << movie.rating	
			end
		end
	end

	def count
		Movie.count
	end

	def total_entries
		movies.total_count
	end

	def movies
		@movies ||= fetch_movies
	end

	def fetch_movies
		search_string = []
		columns.each do |term|
			search_string << "#{term} like :search"
		end

		movies = Movie.page(page).per(per_page)
		movies = movies.where(search_string.join(' or '), search: "%#{params[:search][:value]}%"
	end

	def columns
		%w(title, category, rating)
	end
end