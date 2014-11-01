#!/usr/bin/env ruby

class InstallerMethods
	CHOICES = {
		dotfiles_via_fresh: 'bash -c "`FRESH_LOCAL_SOURCE=samssf/dotfiles bash <(curl -sL get.freshshell.com)`"',
		homebrew: :method,
	}

	def self.choice_map
		@choice_map ||= (
			map = {}
			CHOICES.keys.each_with_index do |choice_key, index|
				map[index + 1] = choice_key
			end
			map
		)
	end

	def self.choice_rmap
		@choice_rmap ||= choice_map.invert
	end

	def self.homebrew
		`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
		`brew doctor`
	end

	def self.proc_for_choice(choice)
		code = CHOICES[choice]
		if code == :method
			Proc.new do
				InstallerMethods.send(choice)
			end
		else
			Proc.new do
				`#{code}`
			end
		end
	end
end

class Installer
	@chosen_items = []

	def print_choices
		puts
		@chosen_items ||= []
		InstallerMethods.choice_map.each_pair do |item_number, choice|
			choice_display_value = choice.to_s.gsub '_', ' '
			is_chosen = @chosen_items.include? item_number 
			puts "[#{is_chosen ? 'X' : ' '}]  (#{item_number}.) #{choice_display_value} "
		end
		puts
		puts '     (ALL) Select all'
		puts '     (NONE) Select none'
		puts
		puts 'Type a number for item to install. Comma-separated values accepted.'
		puts 'Type INSTALL when finished.' if @chosen_items.length > 0
	end

	def install
		@chosen_items.each do |chosen_item_number|
			chosen_item = InstallerMethods.choice_map(chosen_item_number)
			proc = InstallerMethods.proc_for_choice(chosen_item)
			proc.call
		end
	end

	def run
		print_choices

		until (/INSTALL/.match(input = $stdin.gets.chomp))
			if input =~ /NONE/i
				@chosen_items = []
			elsif input =~ /ALL/i
				@chosen_items = InstallerMethods.choice_map.keys
			else
				items = input.split(',')
				items.each { |item| @chosen_items << item.to_i unless item.to_i == 0 }
			end
			
			@chosen_items = @chosen_items.uniq.sort
			print_choices
		end

		install
	end
end

Installer.new.run