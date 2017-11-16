cite about-plugin
about-plugin 'Helpers to more easily work with Mymo'

function aptible-login() {
  about 'Log in to Aptible, setting a 7d expiry on token.'
  group 'mymo'
  param '1: Email to use'
  example 'aptible-login your-email@hellomymo.com'

  # Is parameter #1 (email) zero length?
  if [ -z "$1" ]
  then
    echo "-email is required.-"
    return 1
  fi

  aptible login --email="$1" --lifetime=7d
}
