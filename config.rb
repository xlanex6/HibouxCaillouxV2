# Uses .env in the root of the project
activate :dotenv

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :sprockets

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
  set :relative_links, true
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
end

activate :contentful do |f|
  f.space         = { contentful: 'depeq58b1rph'}
  f.access_token  = ENV['CONTETNFUL_API_KEY']
  f.cda_query     = { content_type: 'sortiesRaquettes', include: 2 }
  f.content_types = { sortiesRaquettes: 'sortiesRaquettes'}
end



