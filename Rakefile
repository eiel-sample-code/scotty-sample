image_name = "eiel/scotty-sample"

task :build do
  sh "docker build -t #{image_name} ."
end

task :run do
  sh "docker run #{image_name}"
end

task :push do
  sh "docker push #{image_name}"
end

task :release do
  sh "docker pull #{image_name}"
  sh "heroku docker:release"
end
