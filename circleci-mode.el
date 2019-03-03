(defconst circleci-constants
  '("version"
    "orbs"
    "executors"
    "commands"
    "parameters"
    "description"
    "jobs"
    "steps"
    "docker"
    "resource_class"
    "machine"
    "macos"
    "shell"
    "working_directory"
    "environment"
    "parallelism"
    "branches"
    "name"
    "entrypoint"
    "command"
    "user"
    "auth"
    "aws_auth"
    "enabled"
    "image"
    "docker_layer_caching"
    "run"
    "command"
    "background"
    "no_output_timeout"
    "when"
    "checkout"
    "setup_remote_docker"
    "save_cache"
    "path"
    "paths"
    "key"
    "keys"
    "restore_cache"
    "deploy"
    "store_artifacts"
    "destination"
    "store_test_results"
    "persist_to_workspace"
    "root"
    "attach_workspace"
    "add_ssh_keys"
    "fingerprints"
    "worksflows"
    "triggers"
    "cron"
    "filters"
    "only"
    "ignore"
    "requires"
    "context"
    "type"
    "<<"
    ))

(defconst circleci-comment "#.*$")
(defconst circleci-name-re "\\(.*\\):" )

(defconst circleci-string-1-re ": \\(.*$\\)" )
(defconst circleci-string-2-re "- \\(.*\\)$")

(setq circleci-highlights
      `((,circleci-comment . font-lock-comment-face)
        (,circleci-string-1-re (1 font-lock-string-face))
        (,(concat "^[ \\|-]*\\(" (regexp-opt circleci-constants) "\\)") (1 font-lock-keyword-face))
        (,circleci-name-re (1 font-lock-function-name-face))
        (,circleci-string-2-re (1 font-lock-string-face))))

(define-derived-mode circleci-mode fundamental-mode "circleci"
  "Major mode for editing circleci config files."
  (setq font-lock-defaults '(circleci-highlights)))
