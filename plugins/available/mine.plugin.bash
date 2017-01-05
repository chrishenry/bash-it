cite about-plugin
about-plugin 'My helper functions'

git_changelog()
{
  about 'generate a changelog from master to this branch'
  group 'mine'
  gitchangelog show master..`gcrb`
}
