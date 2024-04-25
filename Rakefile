namespace :env do
  MISE_EXEC_PREFIX = 'mise exec --'

  desc 'Init env'
  task :init do
    if File.exist?('.mise.toml')
      install_mise
      puts "mise installed: #{`mise --version`}"
      sh "mise install"
    end
    
    if File.exist?('.pre-commit-config.yaml')
      Rake::Task['env:githook'].invoke
    end
  end

  desc 'Install git hook'
  task :githook do
    sh "#{MISE_EXEC_PREFIX} pre-commit install"
  end

  def install_mise
    output = `which mise >/dev/null 2>&1`
    if $?.success?
      return
    end

    puts "mise not found, installing..."
    sh "curl https://mise.run | sh"

    case ENV['SHELL']
    when /bash/
      sh 'echo "eval \"\$(~/.local/bin/mise activate bash)\"" >> ~/.bashrc'
      sh "source ~/.bashrc"

    when /zsh/
      sh 'echo "eval \"\$(~/.local/bin/mise activate zsh)\"" >> ~/.zshrc'
      sh "zsh -c 'source ~/.zshrc'"

    else
      puts "Unknown shell env!"
      exit 1
    end
  end
end

namespace :swift do
  FORMAT_COMMAND = 'swift package --allow-writing-to-package-directory format'
  TEST_COMMAND = 'xcodebuild -scheme RakuyoKit -destination'

  desc 'Run Format'
  task :format do
    sh FORMAT_COMMAND
  end

  desc 'Run Lint'
  task :lint do
    sh FORMAT_COMMAND + ' --lint'
  end

  desc 'Test'
  task :test do
    sh TEST_COMMAND + " 'platform=iOS Simulator,OS=17.4,name=iPhone 15 Pro'"
  end
end
