class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  MODEL = 'gpt-3.5-turbo'

  def home
    @content = ""
    @tags = []
  end

  def index

    @client = OpenAI::Client.new(access_token: ENV['OPENAI_API'])
    @keywords = []
    venuetypes = Venuetype.all
    venuetypes.each do |type|
      @keywords << type.name
    end

    @content = ""
    @tags = []

    if params[:query].present?
      user_query = [params[:query]]
      user_query << "Can you suggest a suitable venue type?"
      user_query << "And the response should have keywords such as between a #{@keywords.join(' , ')}"
      user_query << "Response should be between at least two different suggestions between 20 and 60 words"

      response = @client.chat(
        parameters: {
          model: MODEL,
          messages: [
            { role: "user", content:user_query.join(' ') },
          ],
          temperature: 0.7
        }
      )
      @content = response['choices'][0]['message']['content']
    end

    @keywords.each do |key|
      ismatch = @content.to_s.match?(/\b#{key}\b/i)
      puts "key #{key}"
      @tags << key if ismatch
    end


    # @content = ["Content"]
    # @tags = ["Tags1", "Tag2"]

    respond_to do |format|
      format.html
      format.text { render partial: "pages/suggestions", locals: {content: @content, tags: @tags}, formats: [:html] }
    end
  end
end
