# frozen_string_literal: true

require_relative "./tfhelps/version"
require "net/http"
require "uri"
require "json"

module Tfhelps
  class Error < StandardError; end

  class GeminiClient
    def initialize(api_key)
      @url = URI.parse("https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=#{api_key}")
    end

    def format_text(text)
      prompt = "Format the following text in a professional and readable way:\n\n#{text}"

      http = Net::HTTP.new(@url.host, @url.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(@url.path, { "Content-Type" => "application/json" })

      response = http.request(request, { "prompt" => prompt }.to_json)

      return JSON.parse(response.body)["content"] if response.code == "200"

      raise Error, "Failed to format text: #{response.code} - #{response.body}"
    end
  end

  def self.format(text, api_key)
    client = GeminiClient.new(api_key)
    client.format_text(text)
  end
end
