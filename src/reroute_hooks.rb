# frozen_string_literal: true

def run_hook_if_exists(hook_path, *args)
  return unless File.exist?(hook_path)

  return if system(hook_path, *args)

  puts("Git hook #{hook_path} failed!")

  exit 1
end

def calculate_hook_paths
  repo_root_dir = File.expand_path(__dir__)
  repo_root_dir = File.dirname(repo_root_dir)
  repo_root_dir = File.dirname(repo_root_dir)

  paths_env = ENV.fetch('FLEXIBLE_COMMIT_HOOKS_DIRS', './hooks')
  paths_env.split(File::PATH_SEPARATOR).map do |raw_path|
    File.expand_path(raw_path, repo_root_dir)
  end
end

def run_hooks_in_order(hook_name, *args)
  calculate_hook_paths.each do |path|
    hook_path = File.join(path, hook_name)
    run_hook_if_exists(hook_path, *args)
  end
end
