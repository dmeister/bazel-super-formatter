load("@aspect_rules_js//npm:npm_import.bzl", "npm_translate_lock")
load("@python3//:defs.bzl", "interpreter")
load("@rules_python//python:pip.bzl", "pip_parse")

def parse_dependencies():
    npm_translate_lock(
        name = "aspect_rules_format_npm",
        link_workspace = "aspect_rules_format",
        pnpm_lock = "@aspect_rules_format//:pnpm-lock.yaml",
    )

    pip_parse(
        name = "aspect_rules_format_pypi",
        python_interpreter_target = interpreter,
        requirements_lock = "@aspect_rules_format//:requirements_lock.txt",
    )