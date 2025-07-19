# frozen_string_literal: true

def run_hook_if_exists(hook_path, *args)
  return unless File.exist?(hook_path)

  return if system(hook_path, *args)

  puts("Git hook #{hook_path} failed!")

  exit 1
end

def run_repository_hook_if_exists(hook_name, *args)
  hook_path = File.expand_path(__dir__)
  hook_path = File.dirname(hook_path)
  hook_path = File.dirname(hook_path)
  hook_path = File.join(hook_path, 'hooks', hook_name)
  run_hook_if_exists(hook_path, *args)
end

def run_global_hook_if_exists(hook_name, *args)
  global_path = ENV.fetch('FLEXIBLE_COMMIT_HOOKS_GLOBAL_PATH', nil)
  return if global_path.nil?

  hook_path = File.expand_path(global_path)
  hook_path = File.join(hook_path, 'hooks', hook_name)
  run_hook_if_exists(hook_path, *args)
end

def run_global_then_repository_hooks(hook_name, *args)
  run_global_hook_if_exists(hook_name, *args)
  run_repository_hook_if_exists(hook_name, *args)
end
