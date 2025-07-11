def run_hook_if_exists(hook_path)
    if (File.exist?(hook_path)) then
        if not(system(hook_path, ARGV[0]))
            exit 1
        end
    end
end

def run_repository_hook_if_exists(hook_name)
    hook_path = File.expand_path(__dir__)
    hook_path = File.dirname(hook_path)
    hook_path = File.dirname(hook_path)
    hook_path = File.join(hook_path, "hooks", hook_name)
    run_hook_if_exists(hook_path)
end

def run_global_hook_if_exists(hook_name)
    global_path = ENV["FLEXIBLE_COMMIT_HOOKS_GLOBAL_PATH"]
    unless global_path.nil?()
        hook_path = File.expand_path(global_path)
        hook_path = File.join(hook_path, "hooks", hook_name)
        run_hook_if_exists(hook_path)
    end
end

def run_global_then_repository_hooks(hook_name)
    run_global_hook_if_exists(hook_name)
    run_repository_hook_if_exists(hook_name)
end