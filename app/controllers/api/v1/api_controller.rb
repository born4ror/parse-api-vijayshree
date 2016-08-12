class Api::V1::ApiController < ActionController::Base
  require 'nokogiri'
  require 'open-uri'
   
  def fetch_api_data
  	client_app = ClientDataContent.new(url: params[:url])
    doc = Nokogiri::HTML(open(params[:url]))
    a =  doc.search("//a")
	  h1 = doc.search("//h1")
    h2 = doc.search("//h2")
    h3 = doc.search("//h3")
    client_app.links = a.map{|e| e.attributes["href"]}.compact.map(&:value)
    client_app.h1 = h1.map{|e| e.children.first.text}
    client_app.h2 = h2.map{|e| e.children.first.text}
    client_app.h3 = h3.map{|e| e.children.first.text}
    client_app.save
    render json: { response: client_app.as_json, status: true, errorList: [] }
  end  

  def get_all_contents
    urls = ClientDataContent.all
    unless urls.blank?
      render json: { response: [list: urls.map{|e| [urls: e.url.as_json, h1: e.h1.as_json, h2: e.h2.as_json, h3:e.h3.as_json ]}], status: true, errorList: [] }
    else
      render json: {response: [ { list: [] }], status: false, errorList: [" Data not present"] }
    end
  end                               

  private

  def params_client
	params.require(:client_data_content).permit(:url,:h1,:h2,:h3)
  end
end
