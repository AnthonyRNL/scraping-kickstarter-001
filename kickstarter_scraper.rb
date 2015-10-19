# require libraries/modules here
require "nokogiri"
require "pry"
def create_project_hash
  # write your code here
  html = File.read("fixtures/kickstarter.html")
  kickstarter = Nokogiri::HTML(html)
  projects = {}
  kickstarter.css("li.project.grid_4").each do |project|
    # binding.pry
    title = project.css("h2.bbcard_name strong a").text.to_sym
  # binding.pry
    projects[title] = {
      :image_link => project.css(".project-thumbnail a img").attribute("src").value,
      :description => project.css(".bbcard_blurb").text,
      :location => eval(project.css(".project-meta li a").attribute("data-location").value)[:short_name],
      :percent_funded => project.css(".first.funded strong").text.to_i
      }

  end
  projects
end
