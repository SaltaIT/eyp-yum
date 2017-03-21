# # subscription-manager repo-override --help
# Usage: subscription-manager repo-override [OPTIONS]
#
# Manage custom content repository settings
#
# Options:
#   -h, --help            show this help message and exit
#   --proxy=PROXY_URL     proxy URL in the form of proxy_hostname:proxy_port
#   --proxyuser=PROXY_USER
#                         user for HTTP proxy with basic authentication
#   --proxypassword=PROXY_PASSWORD
#                         password for HTTP proxy with basic authentication
#   --repo=REPOID         repository to modify (can be specified more than once)
#   --remove=NAME         name of the override to remove (can be specified more
#                         than once); used with --repo option.
#   --add=NAME:VALUE      name and value of the option to override separated by
#                         a colon (can be specified more than once); used with
#                         --repo option.
#   --remove-all          remove all overrides; can be specific to a repository
#                         by providing --repo
#   --list                list all overrides; can be specific to a repository by
#                         providing --repo
#
