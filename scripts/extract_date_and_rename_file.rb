#!/usr/bin/env ruby

require 'pdf-reader'
require 'chronic'
require 'date'
require 'find'

months = 'january|february|march|april|may|june|july|august|september|october|november|december|jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec'

Find.find(ARGV[0]) do |item|

  begin
    reader = PDF::Reader.new item
    date = nil

    reader.pages.each do |page|
      begin
        pdfText = page.text

        pdfText.split(/\n/).each do |line|

          if (data = line.match(/(\d\d?)[[:space:]]?(\.|\/|\-)[[:space:]]?(\d\d?)[[:space:]]?(\.|\/|\-)[[:space:]]?((20|19)?(\d\d))/i)) ||
            (data = line.match(/(#{months})(,\.|\/|\-|[[:space:]])?[[:space:]]?[[:space:]]?(\d\d?)(,|\.|\/|\-|[[:space:]])[[:space:]]?((20|19)?(\d\d))/i)) ||
            (data = line.match(/(\d\d?)(,|\.|\/|\-|[[:space:]])[[:space:]]?(#{months})(,\.|\/|\-|[[:space:]])?[[:space:]]?[[:space:]]?((20|19)?(\d\d))/i))
            begin
              data = data[0]
              data.gsub! /([[:space:]])/, ' '
              data.gsub! /[,\-\.\/]/, ' '
              data.gsub! /(#{months})/i, '\0 '
              data.gsub! /\s{2,}/, ' '
              d = Chronic.parse data
              if d && d.year >= 2010 && d < Time.now
                date = d if date == nil || d > date
              end
            rescue => e
              puts "ERROR parsing date: #{$!}"
            end
          end
        end

      rescue => e
        puts "ERROR reading page: #{$!}"
      end

    end
    if date
      # puts "script result for #{item} is #{date.strftime("%Y%m%d")}"
      date_string = date.strftime("%Y_%m_%B_%d")

      filename = File.basename(item, File.extname(item))
	directory = File.dirname(item)
      File.rename(item, "#{directory}/#{date_string}|-|#{filename}#{File.extname(item)}")
    end
  rescue => e
    puts "ERROR reading file: #{$!}"
  end

end

exit 0

