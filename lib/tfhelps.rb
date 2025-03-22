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
      prompt = <<~PRO
        Format the following text into a professional and readable structure.
          Follow these guidelines:
          1. Combine sentences into a single paragraph if they are separated by a single empty line.
          2. Create a new paragraph whenever there are two or more empty lines separating the text.
          3. Ensure proper spacing, punctuation, and capitalization throughout the text.
          4. Maintain a clean and polished format suitable for professional use.
          5. Do not add a title or any additional text content that is not present in the original text.

          Text to format:
          #{text}
      PRO

      http = Net::HTTP.new(@url.host, @url.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(@url.request_uri)
      request.content_type = "application/json"

      payload = {
        contents: [{
          parts: [{
            text: prompt
          }]
        }]
      }.to_json

      request.body = payload

      response = http.request(request)

      return JSON.parse(response.body)["candidates"][0]["content"]["parts"][0]["text"] if response.is_a?(Net::HTTPOK)

      raise Error, "Failed to format text: #{response.code} - #{response.body}"
    end
  end

  def self.format(text, api_key)
    client = GeminiClient.new(api_key)
    client.format_text(text)
  end
end
